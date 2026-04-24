# Runbook: obsługa issue przez API

## Cel

Wykonywać operacje na issue przez API w sposób powtarzalny i audytowalny.

## Wymagania wejściowe

1. Hosting repozytorium.
2. Owner i nazwa repozytorium.
3. Token API z właściwymi uprawnieniami.
4. Narzędzia `curl` i `jq`.

## Kroki

1. Ustal repozytorium z `git remote -v` albo z polecenia człowieka.
2. Załaduj wymagane zmienne środowiskowe przez `scripts/load_env.sh` lub jawny mechanizm projektu.
3. Odczytaj issue po numerze, jeśli zadanie dotyczy istniejącego issue.
4. Dla nowego issue przygotuj czytelny opis w Markdown.
5. Wykonaj operację przez właściwy skrypt lub endpoint API.
6. Zweryfikuj wynik ponownym odczytem API.

## Weryfikacja

1. Operacja zakończyła się kodem HTTP 2xx.
2. Issue ma oczekiwany tytuł, treść, stan i metadane.
3. W odpowiedzi nie wypisano sekretów.
