# GitHub API - notatki robocze (issues)

## Instrukcja

- Oprogramowanie: `GitHub`
- Wersja: `GitHub REST API 2022-11-28`

Jak pobrać token API w GitHub:

1. Kliknij avatar (prawy górny róg) -> `Settings`.
2. Wejdź w `Developer settings`.
3. Wybierz `Personal access tokens` -> `Tokens (classic)` lub `Fine-grained tokens`.
4. Wybierz `Generate new token`.
5. Podaj nazwę, czas ważności i zaznacz wymagane uprawnienia do issues.
6. Zatwierdź wygenerowanie tokena.
7. Skopiuj token od razu po wygenerowaniu.

## Zakres użycia

- Pracujemy przez API GitHub (bez `gh` CLI).
- Zakres operacji: odczyt, tworzenie i modyfikacja issues oraz komentarzy.

## Uwierzytelnienie

- Token przekazujemy przez nagłówek:
  - `Authorization: Bearer <GITHUB_TOKEN>`
- Dodatkowe nagłówki API:
  - `Accept: application/vnd.github+json`
  - `X-GitHub-Api-Version: 2022-11-28`

## Konfiguracja lokalna

1. Skopiuj plik:
   - `cp .env.example .env`
2. Uzupełnij sekcję GitHub:
   - `GITHUB_BASE_URL`
   - `GITHUB_OWNER`
   - `GITHUB_REPO`
   - `GITHUB_TOKEN`
3. Załaduj zmienne środowiskowe:
   - `set -a; source .env; set +a`

Uwagi:

- Plik `.env` jest wspólnym miejscem na różne grupy zmiennych środowiskowych.
- Zmienne GitHub (`GITHUB_*`) utrzymuj jako jedną z sekcji tego pliku.

Wymagane narzędzia:

- `curl`
- `jq`
- `bash`

## Skrypt operacyjny

- Skrypt: `scripts/github-issues.sh`
- Pomoc: `scripts/github-issues.sh --help`

Dostępne komendy:

- `scripts/github-issues.sh whoami`
- `scripts/github-issues.sh issues-list [open|closed|all]`
- `scripts/github-issues.sh issue-get <nr>`
- `scripts/github-issues.sh issue-create <tytul> <opis>`
- `scripts/github-issues.sh issue-comment <nr> <komentarz>`
- `scripts/github-issues.sh issue-open <nr>`
- `scripts/github-issues.sh issue-close <nr>`

Uwagi praktyczne:

- `issues-list` filtruje pull requesty i zwraca wyłącznie issues.
- `issues-list` pobiera do 5 stron wyników po 100 rekordów (maksymalnie 500).
- `issue-get` zwraca `assignees` i `labels` jako puste listy, gdy API zwróci `null` dla tych pól.

## Przydatne endpointy API

- `GET /user`
- `GET /repos/{owner}/{repo}/issues?state=open`
- `GET /repos/{owner}/{repo}/issues/{issue_number}`
- `POST /repos/{owner}/{repo}/issues`
- `PATCH /repos/{owner}/{repo}/issues/{issue_number}`
- `POST /repos/{owner}/{repo}/issues/{issue_number}/comments`

## Uwagi bezpieczeństwa

- Nie commitujemy `.env` ani tokenów.
- Token musi mieć uprawnienia do odczytu i zapisu issues w repo docelowym.

## Wyniki testów

- Data testu: `2026-02-11`
- Zakres testu: `whoami`, `issue-create`, `issue-get`, `issue-comment`, `issue-close`, `issue-open`, `issues-list`.
- Repo testowe: `eengineSH/ai-coding-template`
- Wynik dla konfiguracji z `.env`: `PASS`
- Utworzone i domknięte testowe issue: `#1`
