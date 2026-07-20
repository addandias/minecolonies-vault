---
tipo: guia
versao_minecraft: 1.20.1
versao_minecolonies: 1.1.1259
tipo_versao: prerelease
status: publicado
ultima_revisao: 2026-07-20
tags: [minecolonies, administração, configurações, lote-4, lote-10d]
---

# Configurações da colônia

## Na Town Hall

| Opção | Efeito |
|---|---|
| New citizens spawning | Permite novos cidadãos e crianças |
| Auto Worker Hiring | Preenche vagas automaticamente |
| Auto Citizen Housing | Atribui moradias automaticamente |
| Enter/Leave messages | Exibe entrada e saída de jogadores |
| Construction tape | Coloca fita ao criar ordens de construção |

As opções de estilo controlam pacote padrão, cor da colônia, bandeira e aparência quando disponível.

## Permissões

Revise permissões antes de adicionar jogadores. A proteção da colônia controla construção, quebra, interação com blocos e outras ações dentro da área protegida.

## Arquivos de configuração

Configurações comuns e de servidor podem mudar tamanho máximo, doenças, invasões e outros sistemas. Em servidor, alterações devem ser feitas por quem administra o mundo e podem variar conforme o modpack.

### Pathfinding em 1259-snapshot

A opção de servidor **`pathNodeLimitMultiplier`** multiplica o limite de nós pesquisados pelo pathfinding. O valor padrão e mínimo é `1`; o máximo permitido é `4`.

Valores maiores deixam o cidadão procurar rotas em uma área mais ampla, mas aumentam o custo de processamento. Antes de alterar:

1. corrija bloqueios físicos, rotas interrompidas e chunks descarregados;
2. aumente apenas um nível por vez;
3. observe o desempenho do servidor e o comportamento do mesmo cidadão;
4. retorne ao valor anterior se o ganho não compensar o custo.

As antigas opções de verbosidade e número máximo de threads do pathfinding foram removidas nessa atualização.

> [!WARNING]
> Faça backup antes de alterar arquivos do mundo. Este guia documenta a interface; valores externos podem mudar entre versões e modpacks.

## Fontes

- [Town Hall — Wiki oficial do MineColonies](https://minecolonies.com/wiki/buildings/townhall/)
- [Configuration Options — Wiki oficial](https://minecolonies.com/wiki/misc/configfile/)
- [PR #11698 — Pathfinding improvements for bridges](https://github.com/ldtteam/minecolonies/pull/11698)
