---
tipo: sistema
status: publicado
ultima_revisao: 2026-07-16
tags: [minecolonies, administração, pedidos, lote-4]
---

# Sistema de pedidos

## Como funciona

Quando um cidadão precisa de um item, procura no inventário pessoal, bloco da cabana e Racks. Se não encontrar, cria uma solicitação automática.

```mermaid
flowchart LR
    A["Trabalhador precisa de item"] --> B["Procura na cabana"]
    B --> C["Warehouse"]
    C --> D["Oficina capaz de fabricar"]
    D --> E["Courier transporta"]
    E --> F["Pedido concluído"]
```

Se o Warehouse não possuir o item, o sistema procura um artesão que conheça a receita e decompõe o pedido em entradas menores. Quando nenhuma cadeia consegue produzir, o jogador precisa fornecer manualmente.

## Ferramentas

- **Clipboard:** mostra solicitações da colônia e pode ocultar pedidos constantes.
- **Postbox:** permite ao jogador solicitar itens à colônia.
- **Stash:** envia itens do jogador ao Warehouse.
- **Pickup Priority:** números maiores priorizam coleta; entregas continuam urgentes.

## Diagnóstico

1. Abra o pedido e identifique o primeiro item não resolvido.
2. Confirme que a oficina correta existe.
3. Verifique se a receita foi ensinada.
4. Procure as entradas no Warehouse.
5. Confira Couriers e espaço de armazenamento.
6. Forneça manualmente apenas o elo que a colônia ainda não produz.

## Fontes

- [Requests — Wiki oficial do MineColonies](https://minecolonies.com/wiki/systems/request/)
