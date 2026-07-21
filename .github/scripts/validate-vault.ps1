[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Push-Location $repoRoot

try {
    $paths = @(& git -c core.quotepath=false ls-files --cached --others --exclude-standard)
    if ($LASTEXITCODE -ne 0) {
        throw 'Nao foi possivel listar os arquivos do Vault.'
    }

    $paths = @($paths | Where-Object { $_ -and (Test-Path -LiteralPath $_ -PathType Leaf) })
    $markdownFiles = @($paths | Where-Object { [System.IO.Path]::GetExtension($_) -eq '.md' })
    $errors = [System.Collections.Generic.List[object]]::new()

    function Add-ValidationError {
        param(
            [string] $Path,
            [int] $Line,
            [string] $Message
        )

        $errors.Add([pscustomobject]@{
            Path = $Path
            Line = $Line
            Message = $Message
        })
    }

    function Normalize-VaultPath {
        param([string] $Path)
        return ($Path -replace '\\', '/').TrimStart('.', '/')
    }

    Write-Host '1/4 Codificacao'
    & (Join-Path $PSScriptRoot 'check-utf8.ps1') -Paths $paths
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    $pathSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $noteSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $notesByName = @{}

    foreach ($path in $paths) {
        $normalized = Normalize-VaultPath $path
        $null = $pathSet.Add($normalized)

        if ([System.IO.Path]::GetExtension($normalized) -eq '.md') {
            $notePath = $normalized.Substring(0, $normalized.Length - 3)
            $null = $noteSet.Add($notePath)
            $name = [System.IO.Path]::GetFileName($notePath)
            if (-not $notesByName.ContainsKey($name)) {
                $notesByName[$name] = [System.Collections.Generic.List[string]]::new()
            }
            $notesByName[$name].Add($notePath)
        }
    }

    Write-Host '2/4 Links e imagens do Obsidian'
    foreach ($file in $markdownFiles) {
        $lines = @(Get-Content -LiteralPath $file -Encoding UTF8)
        for ($index = 0; $index -lt $lines.Count; $index++) {
            $lineNumber = $index + 1
            $line = $lines[$index]

            foreach ($match in [regex]::Matches($line, '!?\[\[([^\]]+)\]\]')) {
                $reference = $match.Groups[1].Value
                $targetWithHeading = ($reference -split '\|', 2)[0].Trim()
                $target = ($targetWithHeading -split '#', 2)[0].Trim()

                if (-not $target -or $target.Contains('{{')) {
                    continue
                }

                $target = Normalize-VaultPath $target
                $extension = [System.IO.Path]::GetExtension($target)
                $found = $false

                if ($extension) {
                    $found = $pathSet.Contains($target)
                }
                elseif ($target.Contains('/')) {
                    $found = $noteSet.Contains($target)
                }
                elseif ($notesByName.ContainsKey($target)) {
                    $found = $notesByName[$target].Count -gt 0
                }

                if (-not $found) {
                    Add-ValidationError -Path $file -Line $lineNumber -Message "Referencia do Obsidian nao encontrada: $target"
                }
            }

            foreach ($match in [regex]::Matches($line, '!?\[[^\]]*\]\(([^)]+)\)')) {
                $destination = $match.Groups[1].Value.Trim().Trim('<', '>')
                if (-not $destination -or $destination.StartsWith('#') -or $destination -match '^(?i:https?|mailto|obsidian):') {
                    continue
                }

                $destination = ($destination -split '#', 2)[0]
                $destination = [System.Uri]::UnescapeDataString($destination)
                $baseDirectory = Split-Path -Parent $file
                $candidate = if ($baseDirectory) {
                    Join-Path $baseDirectory $destination
                }
                else {
                    $destination
                }

                if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
                    Add-ValidationError -Path $file -Line $lineNumber -Message "Link Markdown local nao encontrado: $destination"
                }
            }
        }
    }

    Write-Host '3/4 Metadados editoriais'
    $editorialFiles = @($markdownFiles | Where-Object {
        $_ -match '^content[/\\]03 - Constru' -or $_ -match '^content[/\\]04 - Profiss'
    })
    $requiredCommon = @('tipo', 'nome', 'nome_pt', 'versao_minecraft', 'versao_minecolonies', 'tipo_versao', 'status')

    foreach ($file in $editorialFiles) {
        $content = Get-Content -Raw -LiteralPath $file -Encoding UTF8
        $frontmatterMatch = [regex]::Match($content, '\A---\r?\n(?<yaml>.*?)\r?\n---', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if (-not $frontmatterMatch.Success) {
            Add-ValidationError -Path $file -Line 1 -Message 'Frontmatter YAML ausente ou mal delimitado.'
            continue
        }

        $yaml = $frontmatterMatch.Groups['yaml'].Value
        $fields = @{}
        foreach ($line in ($yaml -split '\r?\n')) {
            if ($line -match '^([A-Za-z_][A-Za-z0-9_]*):\s*(.*)$') {
                $fields[$Matches[1]] = $Matches[2].Trim()
            }
        }

        $required = [System.Collections.Generic.List[string]]::new()
        $required.AddRange([string[]] $requiredCommon)
        if ($file -match '[/\\]03 - Constru') {
            $required.Add('categoria')
        }
        if ($file -match '[/\\]04 - Profiss') {
            $required.Add('construcao')
        }

        foreach ($field in $required) {
            if (-not $fields.ContainsKey($field) -or [string]::IsNullOrWhiteSpace($fields[$field])) {
                Add-ValidationError -Path $file -Line 1 -Message "Campo obrigatorio ausente ou vazio: $field"
            }
        }

        $expectedValues = @{
            versao_minecraft = '1.20.1'
            versao_minecolonies = '1.1.1259'
            tipo_versao = 'prerelease'
        }
        foreach ($field in $expectedValues.Keys) {
            if ($fields.ContainsKey($field) -and $fields[$field] -ne $expectedValues[$field]) {
                Add-ValidationError -Path $file -Line 1 -Message "Valor invalido em ${field}: esperado '$($expectedValues[$field])', encontrado '$($fields[$field])'."
            }
        }

        if ($fields.ContainsKey('status') -and $fields['status'] -notin @('rascunho', 'em_revisao', 'publicado')) {
            Add-ValidationError -Path $file -Line 1 -Message "Status editorial invalido: $($fields['status'])"
        }
    }

    Write-Host '4/4 Convencao dos registros de versao'
    foreach ($file in $markdownFiles) {
        $lines = @(Get-Content -LiteralPath $file -Encoding UTF8)
        for ($index = 0; $index -lt $lines.Count; $index++) {
            $line = $lines[$index]
            if ($line -match '(?i)snapshot\s+1\.1\.1259') {
                Add-ValidationError -Path $file -Line ($index + 1) -Message "Use o registro curto '1259-snapshot' no texto editorial."
            }
        }
    }

    foreach ($error in $errors) {
        Write-Host "::error file=$($error.Path),line=$($error.Line)::$($error.Message)"
    }

    if ($errors.Count -gt 0) {
        Write-Error "Validacao do Vault falhou com $($errors.Count) erro(s)."
        exit 1
    }

    Write-Host "Vault validado: $($markdownFiles.Count) arquivo(s) Markdown, $($editorialFiles.Count) pagina(s) editorial(is) e nenhuma referencia quebrada."
}
finally {
    Pop-Location
}
