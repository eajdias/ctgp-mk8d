# Protocolo de validação por pista transplantada

1. Eden > botão direito MK8D > Properties > Add-Ons: ativar SÓ o mod da pista em teste (evita interferência).
2. Abrir o slot sacrificado (menu mostra nome/ícone originais — esperado na v1).
3. Checklist: pista carrega? texturas OK? objetos faltando (buracos/invisíveis)? música toca? minimapa aparece? 1 volta completa sem crash?
4. Registrar em `tests/resultados.md`: `CT_XX | slot | OK / FALHA (sintoma)`.
5. Falha → desativar o mod; pista volta ao original (nada é sobrescrito, só LayeredFS).
