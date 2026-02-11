# Forgejo API - notatki robocze (issues)

## Instrukcja

- Oprogramowanie: `Forgejo`
- Wersja: `13.0.2+gitea-1.22.0`

Jak pobrać token API w Forgejo:

1. Kliknij avatar (prawy górny róg) -> `Settings`.
2. Wejdź w `Applications`.
3. W sekcji tokenów wybierz `Generate New Token`.
4. Podaj nazwę tokena i zaznacz wymagane scope.
5. Zatwierdź `Generate Token`.
6. Skopiuj token od razu po wygenerowaniu.

## Zakres użycia

- Pracujemy przez API Forgejo (bez `tea`).
- Zakres operacji: odczyt, tworzenie i modyfikacja issues oraz komentarzy.

## Uwierzytelnienie

- Token przekazujemy przez nagłówek:
  - `Authorization: token <FORGEJO_TOKEN>`
- Bazowy URL API:
  - `https://git.iphoenix.pl/api/v1`

## Konfiguracja lokalna

1. Skopiuj plik:
   - `cp .env.example .env`
2. Uzupełnij token w `FORGEJO_TOKEN`.
3. Załaduj zmienne środowiskowe:
   - `set -a; source .env; set +a`

Uwagi:

- Plik `.env` jest wspólnym miejscem na różne grupy zmiennych środowiskowych.
- Zmienne Forgejo (`FORGEJO_*`) utrzymuj jako jedną z sekcji tego pliku.

Wymagane narzędzia:

- `curl`
- `jq`
- `bash`

## Skrypt operacyjny

- Skrypt: `scripts/forgejo-issues.sh`
- Pomoc: `scripts/forgejo-issues.sh --help`

Dostępne komendy:

- `scripts/forgejo-issues.sh whoami`
- `scripts/forgejo-issues.sh issues-list [open|closed|all]`
- `scripts/forgejo-issues.sh issue-get <nr>`
- `scripts/forgejo-issues.sh issue-create <tytul> <opis>`
- `scripts/forgejo-issues.sh issue-comment <nr> <komentarz>`
- `scripts/forgejo-issues.sh issue-open <nr>`
- `scripts/forgejo-issues.sh issue-close <nr>`

Uwagi praktyczne:

- `issue-get` zwraca `assignees` i `labels` jako puste listy, gdy API zwróci `null` dla tych pól.

## Przydatne endpointy API

- `GET /user`
- `GET /repos/{owner}/{repo}/issues?state=open`
- `GET /repos/{owner}/{repo}/issues/{index}`
- `POST /repos/{owner}/{repo}/issues`
- `PATCH /repos/{owner}/{repo}/issues/{index}`
- `POST /repos/{owner}/{repo}/issues/{index}/comments`

## Uwagi bezpieczeństwa

- Nie commitujemy `.env` ani tokenów.
- Token musi mieć uprawnienia do `repo/issues` odpowiednie do odczytu i zapisu.
