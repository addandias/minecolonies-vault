# Organização dos assets

Os arquivos visuais do Vault são separados pelo tipo de conteúdo que representam. A organização evita misturar capturas de construções, retratos de profissões, ícones de itens e imagens de interface.

## Estrutura

```text
assets/
├── construcoes/<estilo>/<grupo>/<subgrupo>/<construcao>/
├── profissoes/<profissao>/
├── itens/<categoria>/<item>/
├── interfaces/<sistema-ou-tela>/
├── diagramas/<tema>/
└── icones/<uso>/
```

## Regras gerais

- Use nomes de arquivos em letras minúsculas, sem espaços e com hífen quando necessário.
- Prefira `.webp` para imagens novas; preserve `.jpg` e `.png` já publicados para não quebrar links.
- Não misture imagens de tipos diferentes na mesma pasta.
- Registre origem e créditos quando a imagem não tiver sido produzida especialmente para o Vault.
- Uma variante deve ser identificável pelo caminho e nunca apenas pela legenda de uma página.

As páginas navegáveis ficam em [[content/00 - Índices/Índice de Galerias|Índice de Galerias]].
