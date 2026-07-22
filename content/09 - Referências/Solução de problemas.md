---
tipo: referencia
versao_minecraft: 1.20.1
versao_minecolonies: 1.1.1259
tipo_versao: prerelease
status: publicado
ultima_revisao: 2026-07-21
tags: [minecolonies, diagnóstico, suporte, lote-9b, lote-10d]
---

# Solução de problemas

## Diagnóstico rápido

| Sintoma | Verificar primeiro | Próxima leitura |
|---|---|---|
| construtor parado | Materiais, ferramenta, ordem e acesso | [[content/04 - Profissões/Builder - Construtor]] |
| Pedido não chega | Armazém, entregador, rota e prioridade | [[content/06 - Recursos e Produção/Armazém e entregadores]] |
| Cidadãos com fome | Estoque, Salão de Refeições, distância e cardápio | [[content/05 - Alimentação/Sistema de fome]] |
| Cidadão não assume vaga | Contratação, habilidade e limite de trabalhadores | [[content/02 - Administração/Contratação automática]] |
| Oficina não fabrica | Receita, pesquisa, entradas e nível | [[content/06 - Recursos e Produção/Matriz de receitas e oficinas]] |
| Fazenda não produz | Campo atribuído, cultivo, ferramenta e acesso | [[content/03 - Construções/Alimentação/Farmer's Hut - Cabana do Fazendeiro]] |
| Mineiro não avança | Ferramenta, nível da Mina, acesso e pedidos | [[content/03 - Construções/Recursos/Mine - Mina]] |
| Felicidade baixa | Fome, doença, moradia, emprego, luto e distância | [[content/02 - Administração/Felicidade dos cidadãos]] |
| Guardas falham | Cobertura, equipamento, treinamento e alimento | [[content/07 - Defesa/Estratégia defensiva]] |
| Expedição do Nether não inicia | Pesquisa, trabalhador, alimento e pedidos | [[content/06 - Recursos e Produção/Expedições ao Nether]] |
| Cidadão não encontra a rota | Ponte, escada, água, chunks e bloqueios físicos | [[content/02 - Administração/Configurações da colônia#Pathfinding em 1259-snapshot|Configurações da colônia]] |
| Cidadão desaparece em área distante | Chunks descarregados, casa e trabalho válidos | Seção abaixo |

## Áreas parcialmente descarregadas

Em 1259-snapshot, um cidadão pode desaparecer temporariamente depois de insistir em uma rota para uma área descarregada. Se possui casa ou trabalho válido, ele não deve reaparecer na Prefeitura: o retorno ocorre ao nascer do sol ou na verificação periódica de cinco minutos.

Antes de usar Recall Workers, carregue a casa, o trabalho e o caminho entre eles. guardas também pulam pontos de patrulha descarregados.

As melhorias da mesma versão tornam pontes mais atraentes que travessias a nado e estabilizam o movimento em escadas. Se o erro persistir com todos os chunks carregados, revise a geometria da rota e só depois considere aumentar `pathNodeLimitMultiplier`.

## Método de isolamento

1. escolha um único cidadão ou construção;
2. abra a interface e leia o pedido atual;
3. confirme se o item existe no Armazém;
4. confirme se existe entregador e rota transitável;
5. confira ferramenta, alimento e saúde;
6. revise pesquisa, nível e receita;
7. use Recall Workers se o cidadão estiver preso;
8. altere uma variável por vez e observe o resultado.

> [!IMPORTANT]
> Modpacks, configurações de servidor e versões diferentes podem mudar receitas, limites e comportamento. Registre a versão antes de comparar o problema com o guia.

## Quando pedir ajuda

Informe:

- versão do Minecraft, MineColonies, Structurize e loader;
- modpack e alterações de configuração;
- nome e nível da construção;
- pedido exibido na interface;
- trecho relevante do log, quando houver erro;
- passos para reproduzir o problema.

## Fontes

- [PR #11698 — melhorias de pathfinding e pontes](https://github.com/ldtteam/minecolonies/pull/11698)
- [PR #11721 — melhorias de escadas e movimento](https://github.com/ldtteam/minecolonies/pull/11721)
- [PR #11736 — cidadãos em colônias parcialmente descarregadas](https://github.com/ldtteam/minecolonies/pull/11736)
