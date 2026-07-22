# Imagens de itens

Organize os itens primeiro por função e depois pelo identificador do item.

```text
itens/
└── <categoria>/
    └── <item>/
        ├── principal.webp
        ├── <estado>.webp
        └── variantes/
            └── <variante>.webp
```

Categorias recomendadas: `ferramentas`, `equipamentos`, `alimentos`, `recursos`, `pergaminhos` e `blocos`.

- `principal.webp`: representação canônica do item.
- `<estado>.webp`: demonstração funcional, como `aberto`, `fechado` ou `antes-de-colocar`.
- `variantes/`: versões visuais ou funcionais distintas do mesmo item.
- Alterações apenas de quantidade, durabilidade ou encantamento não devem gerar uma variante visual sem necessidade editorial.

Arquivos oficiais já publicados em `.png` podem manter o formato original. Os portões ficam em `blocos/gate_wood/` e `blocos/gate_iron/`, separados por serem itens funcionais distintos.

## Origem e créditos

Os ícones e as capturas dos portões provêm do projeto [ldtteam/MinecoloniesWiki](https://github.com/ldtteam/MinecoloniesWiki). Os ícones preservam o snapshot `abe15af84bf730fc592f43b5f14cd971c336ebde`, já registrado nos créditos gerais do projeto.
