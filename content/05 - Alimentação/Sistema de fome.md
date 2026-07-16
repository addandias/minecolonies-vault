---
tipo: sistema
status: publicado
ultima_revisao: 2026-07-16
tags: [minecolonies, alimentação, fome, lote-2]
---

# Sistema de fome

## Como funciona

Cidadãos precisam comer para continuar trabalhando. Quando sentem fome, procuram um [[content/03 - Construções/Alimentação/Dining Hall - Salão de Refeições|Dining Hall]] ou recebem comida do Waiter. Sem uma fonte acessível, o trabalho desacelera e a felicidade da colônia sofre.

## Fluxo completo

```mermaid
flowchart LR
    A["Farmer ou Fisher"] --> B["Warehouse"]
    B --> C["Chef's Kitchen"]
    C --> B
    B --> D["Dining Hall"]
    D --> E["Cidadãos alimentados"]
```

## Qualidade

Refeições do MineColonies podem ter qualidade ouro, prata ou bronze. Comidas vanilla aparecem sem classificação e são úteis no início, mas não devem ser a solução permanente quando a colônia já consegue produzir pratos melhores.

## Diagnóstico

Se cidadãos continuarem famintos, confira:

- alimento autorizado no Dining Hall;
- combustível disponível;
- estoque no salão ou Warehouse;
- Waiter atribuído;
- caminhos entre moradia e salão;
- Couriers suficientes;
- ingredientes e receitas da Chef's Kitchen.

## Estratégia

Construa o primeiro Dining Hall cedo, perto das Residences. Mantenha uma comida simples de emergência e desenvolva agricultura, pesca e cozinha conforme a população crescer.

## Fontes

- [Dining Hall — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/cook/)
- [Chef's Kitchen — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/kitchen/)
