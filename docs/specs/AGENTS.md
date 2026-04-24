# AGENTS - docs/specs

Ten plik jest mapą specyfikacji AI dla funkcjonalności projektu.

## Cel katalogu `docs/specs/`

- Przechowywanie specyfikacji funkcjonalnych przygotowywanych do implementacji.
- Utrzymanie jednego miejsca, w którym agent wie, jak znaleźć i tworzyć specyfikacje.
- Procedury operacyjne (runbooki) są utrzymywane osobno w `docs/runbooks/`.

## Mapa plików

- `docs/specs/AGENTS.md`
  - Indeks i zasady tworzenia specyfikacji.
- `docs/specs/_template.md`
  - Bazowy szablon specyfikacji end-to-end.
- `docs/specs/*.md`
  - Właściwe specyfikacje funkcjonalności (po jednym pliku na funkcjonalność).

## Zasady tworzenia specyfikacji

- Twórz jeden plik specyfikacji na jedną funkcjonalność.
- Stosuj nazwy w schemacie `NNN-nazwa.md`, np. `001-logowanie-uzytkownika.md`.
- Specyfikacja powinna być kompletna end-to-end i gotowa do implementacji bez zostawiania otwartych decyzji.
- Każda specyfikacja powinna zawierać co najmniej:
  - cel biznesowy i zakres,
  - wymagania funkcjonalne,
  - przypadki użycia,
  - przypadki brzegowe,
  - wpływ na istniejące elementy systemu,
  - kryteria akceptacji,
  - plan walidacji.
- Jeśli specyfikacja zastępuje starszą wersję, dodaj sekcję "Historia zmian".
- Po dodaniu nowego pliku dopisz go do sekcji "Mapa plików" w tym dokumencie.
