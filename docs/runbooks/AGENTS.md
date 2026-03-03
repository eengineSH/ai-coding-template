# AGENTS - docs/runbooks

Ten plik jest mapą instrukcji operacyjnych (runbooków) dla agenta.

## Cel katalogu `docs/runbooks/`

- Przechowywanie powtarzalnych procedur operacyjnych.
- Standaryzacja działań technicznych wykonywanych wielokrotnie.
- Specyfikacje funkcjonalności są utrzymywane osobno w `docs/specs/`.

## Mapa plików

- `docs/runbooks/AGENTS.md`
  - Indeks i zasady tworzenia runbooków.
- `docs/runbooks/atomowe-commity.md`
  - Procedura dzielenia zmian na atomowe, logiczne commity (issue `#12`).
- `docs/runbooks/*.md`
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
