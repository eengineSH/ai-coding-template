# scripts

Katalog zawiera skrypty pomocnicze do pracy z repozytorium i integracjami.

## Zawartość

- [`forgejo-issues.sh`](forgejo-issues.sh) - operacje na issue przez API Forgejo (odczyt, tworzenie, komentarze, zmiana stanu).
- [`github-issues.sh`](github-issues.sh) - operacje na issue przez API GitHub (odczyt, tworzenie, komentarze, zmiana stanu).
- [`load_env.sh`](load_env.sh) - bezpieczne ładowanie wybranych kluczy z `.env` bez wypisywania sekretów.

## Uruchamianie

Skrypty uruchamiaj z poziomu repo po ustawieniu wymaganych zmiennych środowiskowych.
Szczegóły konfiguracji są opisane w dokumentacji technicznej katalogu [`docs/`](../docs/).
