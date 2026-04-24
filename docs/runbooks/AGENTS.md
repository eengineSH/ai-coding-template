# AGENTS - docs/runbooks

Ten plik jest mapą instrukcji operacyjnych (runbooków) dla agenta.

## Cel katalogu `docs/runbooks/`

- Przechowywanie powtarzalnych procedur operacyjnych.
- Standaryzacja działań technicznych wykonywanych wielokrotnie.
- Specyfikacje funkcjonalności są utrzymywane osobno w `docs/specs/`.

## Mapa plików

- `docs/runbooks/AGENTS.md`
  - Indeks i zasady tworzenia runbooków.
- `docs/runbooks/001-pr-review.md`
  - Ogólna procedura przeglądu Pull Requesta.
- `docs/runbooks/002-smoke-test-po-zmianach.md`
  - Ogólna procedura smoke testu po zmianach.
- `docs/runbooks/003-obsluga-issue-api.md`
  - Ogólna procedura obsługi issue przez API.
- `docs/runbooks/004-release-deploy-checklista.md`
  - Ogólna checklista release/deploy.
- `docs/runbooks/005-diagnostyka-ci.md`
  - Ogólna procedura diagnostyki błędów CI.
- `docs/runbooks/006-przygotowanie-issue-i-specyfikacji.md`
  - Ogólna procedura przygotowania i weryfikacji issue oraz wstępnej specyfikacji.
- `docs/runbooks/007-atomowe-commity.md`
  - Ogólna procedura dzielenia zmian na atomowe, logiczne commity.
- `docs/runbooks/*.md`
  - Poszczególne runbooki (jeden plik na jeden proces/obszar).

## Zasady tworzenia runbooków

- Twórz jeden runbook na jedną procedurę.
- Stosuj nazwy opisowe, np. `obsluga-issue.md`, `przygotowanie-pr.md`.
- Runbooki w tym template są celowo syntetyczne i nie zawierają założeń konkretnego projektu.
- Każdy runbook powinien zawierać:
  - cel i zakres procedury,
  - wymagania wejściowe (uprawnienia, tokeny, narzędzia),
  - kroki wykonania,
  - kroki weryfikacji,
  - typowe błędy i sposób reakcji.
- Po dodaniu nowego pliku dopisz go do sekcji "Mapa plików" w tym dokumencie.
