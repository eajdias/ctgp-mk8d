# ctgp-dx-305 — Pistas CTGP Deluxe no MK8D 3.0.5 (Eden)

## Objetivo
Jogar pistas custom do CTGP Deluxe 1.1.1 no Mario Kart 8 Deluxe **3.0.5 64-bit** via Eden, sem downgrade.

## Por que não portar o CTGP inteiro (decisão registrada, revisada após questionamento)
- 3.0.3 = ARM 32-bit, 3.0.5 = ARM 64-bit: patches de código com endereço absoluto morreram **nessa forma** — mas patches SIMPLES são relocáveis com esforço moderado (Ghidra + diff entre NSOs). Prova: a comunidade já relocou vários p/ 3.0.5 (pack Fl4sh9174, já instalado no Eden).
- O que permanece difícil de verdade: o **loader custom** (expansão de copas, UI, netplay) em AArch64 — semanas/meses de RE. Hipótese alternativa p/ abandono: desmobilização pós-processo da Nintendo contra o Yuzu (2024), não só dificuldade técnica.
- **Estratégia adotada: transplante** — dados de pista (`.szs`, áudio, texturas) são agnósticos à versão; empacota-se cada pista CT como mod slot-replacement 3.0.5 (padrão comprovado pelo mod Wario Shipyard).

## Escopo fechado (decisão do usuário)
- **Dentro:** ADICIONAR copas custom como o CTGP faz (expansão real, não substituição). **Fora:** netplay (irrelevante).
- Expansão exige loader em AArch64 (tabelas de copa + UI + carregamento de novos IDs) — projeto de RE de verdade, ver `docs/01-estrategia-copas.md`.

## Estrutura
- `docs/00-contexto.md` — o que é version-locked vs. reaproveitável
- `docs/01-estrategia-copas.md` — estratégia de substituição + spikes
- `mapping/CT-track-hypothesis.md` — tabela CT_00..CT_3F → pista (HIPÓTESE, a validar em jogo)
- `tools/transplant.sh` — empacota 1 pista CT → mod Eden pronto (slot-replacement simples)
- `tests/PROTOCOLO.md` — validação em jogo por pista

## Estado
- **PAUSADO — aguardando aprovação explícita do usuário p/ executar.** Documentação pronta p/ análise futura; nada além de scaffold/docs foi autorizado.
- [x] Scaffold + hipótese de mapeamento
- [x] `tools/transplant.sh` funcional (pista + áudio)
- [ ] Spike 1: hactool (já instalado, AUR 1.4.0) + extrair romfs 3.0.5 + localizar tabelas de copa
- [ ] Spike 2: layout de slots + edição MSBT (nomes)
- [ ] Piloto: 1 copa sacrificada → 4 CTs → validar em jogo (transplante) / expansão real (loader, a definir)
- [ ] UI (nomes/ícones) — fase 2
