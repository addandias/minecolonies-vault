---
tipo: sistema
versao_minecraft: 1.20.1
versao_minecolonies: 1.1.1259
tipo_versao: prerelease
status: publicado
ultima_revisao: 2026-07-20
tags: [minecolonies, alimentação, cadeias, lote-2, lote-10c]
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

## Cadeia da Bakery

```mermaid
flowchart LR
    A["Farmer e criadores"] --> B["Warehouse"]
    B --> C["Baker"]
    C --> D["Produtos assados"]
    D --> B
    B --> E["Dining Hall"]
    E --> F["Cidadão"]
```

Garrafas usadas em receitas do Baker ainda podem quebrar. A snapshot 1.1.1259 reduziu essa perda, mas o estoque deve continuar prevendo reposição.

## Como estabilizar

- produza antes de diversificar;
- mantenha estoques mínimos dos ingredientes críticos;
- ensine apenas receitas sustentáveis;
- use Couriers suficientes;
- aproxime produtores, Warehouse, cozinha e salão;
- preserve um alimento de emergência.
- dimensione a produção pelo consumo diário estimado no Dining Hall;
- revalide receitas e rendimentos após atualizar para a 1.1.1259.

## Leitura relacionada

- [[content/05 - Alimentação/Sistema de fome]]
- [[content/05 - Alimentação/Cardápio recomendado]]
- [[content/06 - Recursos e Produção/Armazém e entregadores]]

## Fontes

- [PR #11683 — Food Adjustments #1](https://github.com/ldtteam/minecolonies/pull/11683)
- [PR #11714 — Bottle safety](https://github.com/ldtteam/minecolonies/pull/11714)
