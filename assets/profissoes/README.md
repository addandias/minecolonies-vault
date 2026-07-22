# Imagens de profissões

Use uma pasta por profissão, com o nome oficial normalizado em letras minúsculas e hífens.

```text
profissoes/
└── <profissao>/
    ├── principal.png
    ├── trabalho.webp
    └── variantes/
        └── <cultura>-<genero>-<variante>.png
```

- `principal.png`: retrato oficial renderizado usado na ficha lateral da profissão.
- `trabalho.webp`: profissão em atividade, quando disponível.
- `variantes/`: aparência alternativa relevante, identificada por cultura, gênero e variante quando esses dados estiverem disponíveis na origem.

Não crie uma variante para representar apenas uma mudança de enquadramento. Vistas da mesma aparência devem usar nomes como `frente`, `costas` ou `detalhe` dentro da pasta da variante.

Os arquivos `*_a`, `*_b`, `*_d` e `*_w` encontrados em `entity_icon` são variantes completas do retrato facial, com 16×16 pixels. Escolha uma delas como `principal.png`; preserve as demais em `variantes/` apenas quando a página realmente apresentar a diversidade visual. No Obsidian, amplie esses arquivos com interpolação desativada para manter o pixel art nítido.

## Origem e créditos

Os retratos oficiais utilizados nesta área provêm do projeto [ldtteam/minecolonies](https://github.com/ldtteam/minecolonies), criado e mantido pela LDTeam e pelos colaboradores do MineColonies e disponibilizado sob a [GNU GPL v3.0](https://github.com/ldtteam/minecolonies/blob/version/main/LICENSE).
