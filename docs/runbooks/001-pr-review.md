# Runbook: przegląd Pull Requesta

## Cel

Wykonać powtarzalny przegląd Pull Requesta bez pomijania kontekstu, ryzyk i weryfikacji.

## Wymagania wejściowe

1. Numer Pull Requesta albo link.
2. Dostęp do repozytorium.
3. Dostęp do metadanych PR, listy plików i diffu.

## Kroki

1. Pobierz metadane PR.
2. Pobierz listę zmienionych plików.
3. Przeczytaj opis PR i powiązane issue lub specyfikację.
4. Sprawdź diff pod kątem:
   a) regresji funkcjonalnych
   b) błędów bezpieczeństwa
   c) brakujących testów
   d) zmian poza zakresem
5. Zweryfikuj lokalne wzorce w podobnym kodzie.
6. Uruchom dostępne testy albo opisz, dlaczego nie zostały uruchomione.
7. Zwróć wynik review z ustalonym priorytetem uwag.

## Weryfikacja

1. Każda uwaga wskazuje konkretny problem.
2. Uwagi blokujące są jasno odróżnione od sugestii.
3. Raport zawiera informację o testach.
