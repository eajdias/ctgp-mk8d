# Estratégia: substituição de copas (data-only)

## Por que não expansão
Adicionar copas além das 24 exige o loader custom do CTGP (código AArch64, tabelas internas, UI) — o pedaço caro (ver README). Netplay está fora do escopo por decisão.

## Como funciona a substituição
1. Cada copa vanilla = definição de dados (tabela de 4 pistas) + arquivos das pistas nos slots.
2. Transplantam-se arquivos de pista CT (já provado: padrão Wario Shipyard) para slots de uma copa sacrificada.
3. Reescrevem-se a definição da copa (aponta p/ os slots transplantados) e os nomes via MSBT (PT-BR incluso).
4. Resultado: 24 copas no menu, com o conteúdo escolhido. Nada é sobrescrito no jogo base (tudo LayeredFS, toggles por mod).

## Spikes
- **Spike 1**: `hactool` (AUR 1.4.0) + extrair romfs 3.0.5 com as keys do usuário (XCI 7,3GB + update v1376256 4,8GB) → localizar tabelas de copa e layout de arquivos por slot.
- **Spike 2**: confirmar nomes de arquivo por slot (comparar com template Wario) + ferramenta de edição MSBT.
- **Piloto**: 1 copa (usuário escolhe a sacrificada + 4 CTs) → mod → validação em jogo.

## Riscos registrados
- Objetos custom (MapObj) podem faltar no jogo base → glitch/crash por pista (validação individual cobre).
- UI (ícones BNTX) fica p/ fase 2; na v1 o menu mostra nomes (MSBT) com ícones originais.
