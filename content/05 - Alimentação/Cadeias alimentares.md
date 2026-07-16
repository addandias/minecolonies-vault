---
tipo: sistema
status: publicado
ultima_revisao: 2026-07-16
tags: [minecolonies, alimentação, cadeias, lote-2]
---

# Cadeias alimentares

> [!NOTE] Análise do Vault
> As cadeias abaixo são uma organização editorial baseada nas dependências e no sistema de pedidos do mod. Elas representam fluxos recomendados para uma colônia estável, não uma ordem oficial obrigatória.

## Cadeia agrícola

```mermaid
flowchart LR
    A["Field"] --> B["Farmer"]
    B --> C["Warehouse"]
    C --> D["Chef"]
    D --> E["Refeição"]
    E --> C
    C --> F["Waiter"]
    F --> G["Cidadão"]
```

## Cadeia da pesca

```mermaid
flowchart LR
    A["Água válida"] --> B["Fisher"]
    B --> C["Warehouse"]
    C --> D["Chef ou Waiter"]
    D --> E["Dining Hall"]
    E --> F["Cidadão"]
```

## Como estabilizar

- produza antes de diversificar;
- mantenha estoques mínimos dos ingredientes críticos;
- ensine apenas receitas sustentáveis;
- use Couriers suficientes;
- aproxime produtores, Warehouse, cozinha e salão;
- preserve um alimento de emergência.

## Leitura relacionada

- [[content/05 - Alimentação/Sistema de fome]]
- [[content/05 - Alimentação/Cardápio recomendado]]
- [[content/06 - Recursos e Produção/Armazém e entregadores]]
