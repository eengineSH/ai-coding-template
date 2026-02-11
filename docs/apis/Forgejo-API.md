# Forgejo API - notatki robocze (issues)

## Instancja

- URL: `https://git.iphoenix.pl`
- Repo: `https://git.iphoenix.pl/Phoenix/TEST-Repo`
- Owner: `Phoenix`
- Nazwa repo: `TEST-Repo`
- Oprogramowanie: `Forgejo`
- Wersja: `13.0.2+gitea-1.22.0`

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
   - `cp .env.forgejo.example .env.forgejo`
2. Uzupełnij token w `FORGEJO_TOKEN`.
3. Załaduj zmienne środowiskowe:
   - `set -a; source .env.forgejo; set +a`

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

## Przydatne endpointy API

- `GET /user`
- `GET /repos/{owner}/{repo}/issues?state=open`
- `GET /repos/{owner}/{repo}/issues/{index}`
- `POST /repos/{owner}/{repo}/issues`
- `PATCH /repos/{owner}/{repo}/issues/{index}`
- `POST /repos/{owner}/{repo}/issues/{index}/comments`

## Uwagi bezpieczeństwa

- Nie commitujemy `.env.forgejo` ani tokenów.
- Token musi mieć uprawnienia do `repo/issues` odpowiednie do odczytu i zapisu.
