# Runbook: diagnostyka CI

## Cel

Szybko ustalić przyczynę błędów CI i odróżnić problem kodu od problemu środowiska.

## Wymagania wejściowe

1. Link do runu CI albo nazwa workflow.
2. Commit lub branch.
3. Dostęp do logów CI.

## Kroki

1. Ustal, który job i który krok zakończył się błędem.
2. Pobierz pełny log błędnego kroku.
3. Sprawdź, czy błąd jest deterministyczny.
4. Porównaj z ostatnim zielonym runem, jeśli jest dostępny.
5. Odtwórz błąd lokalnie, gdy to możliwe.
6. Jeśli błąd wynika z kodu, przygotuj poprawkę.
7. Jeśli błąd wynika ze środowiska, opisz zależność i sposób weryfikacji.

## Weryfikacja

1. Przyczyna błędu jest wskazana konkretnie.
2. Poprawka albo rekomendacja ma jasny zakres.
3. Po zmianie CI przechodzi albo wiadomo, co nadal blokuje.
