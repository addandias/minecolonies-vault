---
tipo: sistema
status: publicado
ultima_revisao: 2026-07-21
tags: [minecolonies, produção, cadeias, lote-2]
---

# Cadeias de produção

## Madeira

```mermaid
flowchart LR
    A["Mudas"] --> B["Lenhador"]
    B --> C["Toras e mudas"]
    C --> D["Armazém"]
    D --> E["construtor e oficinas"]
    D --> A
```

Pontos de controle: replantio ativo, espécies autorizadas, zona de corte, machados, mudas em reserva e retirada por entregador.

## Mineração

```mermaid
flowchart LR
    A["Mina"] --> B["mineiro"]
    B --> C["Pedra e minérios"]
    C --> D["Armazém"]
    D --> E["construtor e oficinas"]
    C --> F["Sifter"]
    F --> D
```

Pontos de controle: nível da Mina, ferramentas, profundidade configurada, iluminação e espaço no Armazém. O Sifter é um complemento posterior, desbloqueado por pesquisa.

## Alimentação

A cadeia completa está em [[content/05 - Alimentação/Cadeias alimentares]].

## Madeira processada

Lenhador → Armazém → Serraria → construtor, Fletcher ou outras oficinas.

## Pedra e vidro

Mina → britador → pedreiro ou Olaria → Armazém → construtor. A areia também alimenta vidreiro e misturador de concreto.

## Metalurgia

Mina → Fundição → Ferreiro ou mecânico → trabalhadores consumidores.

## Produção especializada

Agricultura abastece Padaria; corantes abastecem tingidor e misturador de concreto; vidro e ingredientes raros sustentam oficinas avançadas.

## Regra de diagnóstico

Analise a cadeia na ordem:

1. **Entrada:** matéria-prima existe?
2. **Trabalhador:** está presente, alimentado e equipado?
3. **Construção:** nível e receita são suficientes?
4. **Transporte:** há entregador e caminho livre?
5. **Armazenamento:** há espaço e estoque mínimo?
6. **Destino:** o consumidor aceita o item?

## Fontes

- [Forester's Hut — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/lumberjack/)
- [Mine — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/miner/)
- [Sifter's Hut — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/sifter/)
