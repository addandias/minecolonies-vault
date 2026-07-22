---
tipo: guia
status: publicado
ultima_revisao: 2026-07-21
tags: [minecolonies, pecuária, produção, lote-7b]
---

# Pecuária da colônia

| Animal | Entrada | Produtos |
|---|---|---|
| Vaca | Trigo | Carne, couro e leite |
| Ovelha | Trigo | Lã e carne |
| Porco | Alimento compatível | Carne |

## Implantação

1. Construa a cabana perto da produção de alimento.
2. Leve dois animais.
3. Ative reprodução e alimentação.
4. Defina estoque mínimo das ferramentas.
5. Conecte os produtos ao Armazém.
6. Desative reprodução quando a demanda estiver atendida.

## Cadeia

```mermaid
flowchart LR
    A["Farmer"] --> B["Alimento animal"]
    B --> C["Cabanas de pecuária"]
    C --> D["Carne"]
    C --> E["Couro"]
    C --> F["Lã"]
    D --> G["Chef / Salão de Refeições"]
    E --> H["construtor e equipamentos"]
    F --> H
```

## Fontes

- [Cowhand’s Hut — Wiki oficial](https://minecolonies.com/wiki/buildings/cowboy/)
- [Shepherd’s Hut — Wiki oficial](https://minecolonies.com/wiki/buildings/shepherd/)
- [Swineherd’s Hut — Wiki oficial](https://minecolonies.com/wiki/buildings/swineherder/)
