---
tipo: sistema
status: publicado
ultima_revisao: 2026-07-21
tags: [minecolonies, logística, produção, lote-3]
---

# Armazém e entregadores

## Papel na produção

O Armazém centraliza materiais e os entregadores conectam produtores, artesãos e consumidores. Sem essa dupla, pedidos ficam presos mesmo quando os itens existem em alguma cabana.

## Fluxo

```mermaid
flowchart LR
    A["Produtor"] --> B["entregador"]
    B --> C["Armazém"]
    C --> D["entregador"]
    D --> E["Oficina"]
    E --> B
    B --> F["Consumidor"]
```

## Prioridades

- mantenha estradas curtas e desobstruídas;
- melhore Armazém e entregador's Huts conforme o número de oficinas;
- use prioridade de coleta para cabanas que acumulam saídas;
- use **Solicitar coleta agora** (*Request Pickup Now*) apenas como correção pontual;
- evite estoques mínimos excessivos;
- distribua oficinas em torno do eixo logístico.

## Diagnóstico

Quando um pedido não avança, abra sua cadeia completa: confira a entrada no Armazém, o entregador disponível, a receita ensinada, o combustível habilitado e o espaço no destino.

## Construções principais

- [[content/03 - Construções/Transporte/Warehouse - Armazém]]
- [[content/03 - Construções/Transporte/Courier's Hut - Cabana do Entregador]]

## Fontes

- [Warehouse — Wiki oficial](https://minecolonies.com/wiki/buildings/warehouse/)
- [Courier's Hut — Wiki oficial](https://minecolonies.com/wiki/buildings/deliveryman/)
- [Request System — Wiki oficial](https://minecolonies.com/wiki/systems/request/)
