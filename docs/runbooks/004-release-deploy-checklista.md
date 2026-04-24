# Runbook: checklista release/deploy

## Cel

Utrzymać przewidywalny przebieg wydania albo wdrożenia.

## Wymagania wejściowe

1. Branch albo commit do wydania.
2. Lista zmian.
3. Dostęp do środowiska testowego.
4. Decyzja człowieka o wdrożeniu, jeśli projekt jej wymaga.

## Kroki

1. Potwierdź czysty stan working copy.
2. Potwierdź branch i commit.
3. Sprawdź, czy są migracje albo zmiany konfiguracji.
4. Uruchom testy automatyczne.
5. Wykonaj smoke test.
6. Przygotuj krótki opis zmian.
7. Wykonaj wdrożenie zgodnie z procedurą projektu.
8. Po wdrożeniu sprawdź kluczowe ścieżki i logi.

## Weryfikacja

1. Wdrożony commit jest zgodny z testowanym commitem.
2. Testy i smoke test przeszły.
3. Nie ma nowych błędów w monitoringu albo logach.
4. Istnieje plan rollbacku.
