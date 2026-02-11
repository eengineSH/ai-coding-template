# AGENTS - docs/ai-specs

Ten plik jest mapą specyfikacji AI dla funkcjonalności projektu.

## Cel katalogu `docs/ai-specs/`

- Przechowywanie specyfikacji funkcjonalnych przygotowywanych do implementacji.
- Utrzymanie jednego miejsca, w którym agent wie, jak znaleźć i tworzyć specyfikacje.

## Mapa plików

- `docs/ai-specs/AGENTS.md`
  - Indeks i zasady tworzenia specyfikacji.
- `docs/ai-specs/*.md`
  - Właściwe specyfikacje funkcjonalności (po jednym pliku na funkcjonalność).

## Zasady tworzenia specyfikacji

- Twórz jeden plik specyfikacji na jedną funkcjonalność.
- Stosuj nazwy opisowe, np. `logowanie-uzytkownika.md`, `import-kontrahentow.md`.
- Każda specyfikacja powinna zawierać co najmniej:
  - cel biznesowy i zakres,
  - wymagania funkcjonalne,
  - przypadki brzegowe,
  - kryteria akceptacji,
  - wpływ na istniejące elementy systemu.
- Jeśli specyfikacja zastępuje starszą wersję, dodaj sekcję "Historia zmian".
- Po dodaniu nowego pliku dopisz go do sekcji "Mapa plików" w tym dokumencie.
