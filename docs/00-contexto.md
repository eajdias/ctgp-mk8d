# Contexto técnico

Fonte: `~/Downloads/mario-kart-8-dx-ctgp/atmosphere/contents/0100152000022000/` (CTGP 1.1.1, 4,6GB).

## Layout do pack
- `exefs/main.npdm`, `exefs/subsdk1` — código custom (loader/copas). **Version-locked 3.0.3/32-bit. Descartar.**
- `romfs/Course/CT_00..CT_3F/` — 64 pistas (model/kcl/muunt/mapcamera/maptexture/bars). **Reaproveitável.**
- `romfs/Audio/Resource/Stream/pBGM_CT_XX_{F,N(,B)}.bfstm` — música por pista. **Reaproveitável** (renomear p/ slot).
- `romfs/UI/cmn/menu/ym_CoursePict_CT_XX_*.bntx` — previews. Útil p/ identificar pistas (extração BNTX pendente).
- `romfs/RaceCommon/`, `romfs/skyline/` — dados/plugins; skyline **inútil no Eden**.
- `romfs/Audio/Static/BGM.bars`, `UI/cmn/common.sarc`, `boot/` — globais do pack; **não transplantar** (alto risco de conflito com 3.0.5).

## Premissas do transplante (padrão Wario Shipyard, comprovado funcionando)
- Destino: `load/0100152000022000/<Mod>/romfs/Course/<SLOT>/` com os arquivos genéricos (`course_model.szs`, `course_kcl.szs`, `course_muunt.byaml`, ...).
- Áudio: `pBGM_<SLOT>_F.bfstm` + `pBGM_<SLOT>_N.bfstm` (final-lap e normal).
- UI: pulada na v1 (menu mostra nome/ícone originais do slot).
- Risco conhecido: objetos custom (MapObj) da pista podem não existir no jogo base → glitch/crash por pista. Validação em jogo por pista (ver `tests/PROTOCOLO.md`).
