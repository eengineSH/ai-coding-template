# Runbook: smoke test po zmianach

## Cel

Szybko potwierdzić, że najważniejsze ścieżki projektu działają po zmianie.

## Wymagania wejściowe

1. Lista zmienionych obszarów.
2. Dostęp do środowiska testowego albo lokalnego.
3. Komendy uruchomienia aplikacji i testów.

## Kroki

1. Ustal commit, branch i zakres zmian.
2. Uruchom aplikację w docelowym trybie testu.
3. Sprawdź podstawową stronę lub główny entrypoint.
4. Sprawdź ścieżkę bezpośrednio dotkniętą zmianą.
5. Sprawdź jeden scenariusz błędu.
6. Sprawdź logi aplikacji, konsolę albo monitoring, jeśli są dostępne.
7. Zanotuj wynik i blokery.

## Weryfikacja

1. Aplikacja startuje.
2. Główna ścieżka działa.
3. Zmieniony obszar działa.
4. Nie pojawiły się nowe błędy w dostępnych logach.
