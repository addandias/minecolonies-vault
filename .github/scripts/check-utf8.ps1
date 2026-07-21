[CmdletBinding()]
param(
    [string[]] $Paths
)

$ErrorActionPreference = 'Stop'

$textExtensions = [System.Collections.Generic.HashSet[string]]::new(
    [string[]] @('.md', '.json', '.yml', '.yaml', '.toml', '.txt', '.ps1', '.sh', '.css', '.xml'),
    [System.StringComparer]::OrdinalIgnoreCase
)
$textNames = [System.Collections.Generic.HashSet[string]]::new(
    [string[]] @('.editorconfig', '.gitattributes', '.gitignore', '.gitkeep'),
    [System.StringComparer]::OrdinalIgnoreCase
)
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)

if (-not $Paths) {
    $Paths = @(& git -c core.quotepath=false ls-files)
    if ($LASTEXITCODE -ne 0) {
        throw 'Não foi possível listar os arquivos rastreados pelo Git.'
    }
}

$bomFiles = [System.Collections.Generic.List[string]]::new()
$invalidUtf8Files = [System.Collections.Generic.List[string]]::new()
$checked = 0

foreach ($path in $Paths) {
    $fullPath = if ([System.IO.Path]::IsPathRooted($path)) {
        $path
    }
    else {
        Join-Path -Path (Get-Location) -ChildPath $path
    }

    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        continue
    }

    $name = [System.IO.Path]::GetFileName($fullPath)
    $extension = [System.IO.Path]::GetExtension($fullPath)
    if (-not $textExtensions.Contains($extension) -and -not $textNames.Contains($name)) {
        continue
    }

    $checked++
    $bytes = [System.IO.File]::ReadAllBytes($fullPath)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $bomFiles.Add($path)
    }

    try {
        $null = $strictUtf8.GetString($bytes)
    }
    catch {
        $invalidUtf8Files.Add($path)
    }
}

foreach ($path in $bomFiles) {
    Write-Host "::error file=$path::Arquivo UTF-8 contém BOM. Salve como UTF-8 sem BOM."
}
foreach ($path in $invalidUtf8Files) {
    Write-Host "::error file=$path::Arquivo textual não contém UTF-8 válido."
}

if ($bomFiles.Count -gt 0 -or $invalidUtf8Files.Count -gt 0) {
    Write-Error "Validação falhou: $($bomFiles.Count) arquivo(s) com BOM e $($invalidUtf8Files.Count) arquivo(s) com UTF-8 inválido."
    exit 1
}

Write-Host "UTF-8 sem BOM validado em $checked arquivo(s) textual(is)."
