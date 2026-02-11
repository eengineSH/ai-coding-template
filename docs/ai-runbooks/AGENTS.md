# AGENTS - docs/ai-runbooks

Ten plik jest mapą instrukcji operacyjnych (runbooków) dla agenta.

## Cel katalogu `docs/ai-runbooks/`

- Przechowywanie powtarzalnych procedur operacyjnych.
- Standaryzacja działań technicznych wykonywanych wielokrotnie.
- Specyfikacje funkcjonalności są utrzymywane osobno w `docs/ai-specs/`.

## Mapa plików

- `docs/ai-runbooks/AGENTS.md`
  - Indeks i zasady tworzenia runbooków.
- `docs/ai-runbooks/*.md`
  - Poszczególne runbooki (jeden plik na jeden proces/obszar).

## Zasady tworzenia runbooków

- Twórz jeden runbook na jedną procedurę.
- Stosuj nazwy opisowe, np. `obsluga-issue.md`, `przygotowanie-pr.md`.
- Każdy runbook powinien zawierać:
  - cel i zakres procedury,
  - wymagania wejściowe (uprawnienia, tokeny, narzędzia),
  - kroki wykonania,
  - kroki weryfikacji,
  - typowe błędy i sposób reakcji.
- Po dodaniu nowego pliku dopisz go do sekcji "Mapa plików" w tym dokumencie.
