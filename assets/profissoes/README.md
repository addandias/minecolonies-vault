# Imagens de profissões

Use uma pasta por identificador visual do worker. Profissões que compartilham o mesmo conjunto oficial, como `Huscarl` e `Knight`, apontam para a mesma pasta em vez de duplicar imagens.

```text
profissoes/
└── <identificador-do-worker>/
    ├── feminino.png
    └── masculino.png
```

- `feminino.png` e `masculino.png`: renders oficiais completos usados juntos na ficha lateral da profissão.
- A variante `medieval-a` é preferida por combinar com a identidade visual do Vault.
- Quando essa variante não existe, use `default-a`; workers com variações numeradas usam `medieval-1a`.

O Vault importa somente o par usado nas páginas. Outras culturas e variantes permanecem na fonte oficial para evitar dezenas de imagens redundantes por profissão.

## Origem e créditos

Os renders oficiais utilizados nesta área provêm do diretório de [workers do projeto ldtteam/MinecoloniesWiki](https://github.com/ldtteam/MinecoloniesWiki/tree/main/src/assets/images/wiki/workers), mantido pela equipe e pela comunidade do MineColonies e disponibilizado sob a [GNU GPL v3.0](https://github.com/ldtteam/MinecoloniesWiki/blob/main/LICENSE).
