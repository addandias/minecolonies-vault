---
tipo: sistema
versao_minecraft: 1.20.1
versao_minecolonies: 1.1.1259
tipo_versao: prerelease
status: publicado
ultima_revisao: 2026-07-21
tags: [minecolonies, alimentação, fome, lote-2, lote-10c]
---

# Sistema de fome

## Como funciona

Cidadãos precisam comer para continuar trabalhando. Quando sentem fome, procuram um [[content/03 - Construções/Alimentação/Dining Hall - Salão de Refeições|Dining Hall]] ou recebem comida do Waiter. Sem uma fonte acessível, o trabalho desacelera e a felicidade da colônia sofre.

## Fluxo completo

```mermaid
flowchart LR
    A["Farmer ou Fisher"] --> B["Armazém"]
    B --> C["Cozinha do Chef"]
    C --> B
    B --> D["Salão de Refeições"]
    D --> E["Cidadãos alimentados"]
```

## Qualidade e tiers

Refeições do MineColonies possuem um categoria próprio: bronze, prata ou ouro. Em 1259-snapshot, os valores e categorias foram rebalanceados para aproximar alimentos da mesma categoria. A nutrição usada pelos cidadãos também favorece as refeições do mod em relação à comida comum.

Comidas do jogo base normalmente aparecem sem classificação. Uma comida do jogo base só alcança bronze quando combina nutrição e saturação excepcionalmente altas; portanto, continua sendo mais seguro desenvolver um cardápio do MineColonies.

## Consumo por Residência

O nível da Residência influencia o consumo de saturação do cidadão. Os fatores usados pela versão de referência são:

| Nível da Residência | Fator de consumo |
|---:|---:|
| 1 | 0,600 |
| 2 | 0,725 |
| 3 | 1,000 |
| 4 | 1,200 |
| 5 | 1,500 |

residências maiores exigem que a cadeia alimentar cresça junto. Antes de uma melhoria ampla de moradias, confirme a estimativa diária de ingredientes no Salão de Refeições e mantenha margem de estoque.

## Segurança alimentar e interface

- cidadãos não escolhem automaticamente alimentos marcados pelo mod como venenosos;
- ainda é possível forçar manualmente o consumo de um alimento venenoso;
- a barra de alimentação do cidadão agora preenche da esquerda para a direita e usa ícones de tigela vazia, meia e cheia.

## Diagnóstico

Se cidadãos continuarem famintos, confira:

- alimento autorizado no Salão de Refeições;
- combustível disponível;
- estoque no salão ou Armazém;
- Waiter atribuído;
- caminhos entre moradia e salão;
- entregadores suficientes;
- ingredientes e receitas da Cozinha do Chef;
- categoria e variedade compatíveis com o nível das residências;
- estimativa diária de ingredientes exibida no menu do Salão de Refeições.

## Estratégia

Construa o primeiro Salão de Refeições cedo, perto das residências. Mantenha uma comida simples de emergência e desenvolva agricultura, pesca e cozinha conforme a população crescer.

## Fontes

- [Dining Hall — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/cook/)
- [Chef's Kitchen — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/kitchen/)
- [PR #11683 — Food Adjustments #1](https://github.com/ldtteam/minecolonies/pull/11683)
- [PR #11739 — Adjust Food bar](https://github.com/ldtteam/minecolonies/pull/11739)
- [PR #11744 — Citizens don't choose to eat poisoned food](https://github.com/ldtteam/minecolonies/pull/11744)
