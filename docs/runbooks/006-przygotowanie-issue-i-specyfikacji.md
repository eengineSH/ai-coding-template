# Runbook: przygotowanie issue i wstępnej specyfikacji

## Cel

Przygotować issue tak, aby człowiek albo agent mógł na jego podstawie wykonać triage, przygotować specyfikację i rozpocząć pracę bez zgadywania intencji.

## Kiedy używać

1. Gdy tworzysz nowe issue.
2. Gdy sprawdzasz, czy istniejące issue jest gotowe do realizacji.
3. Gdy issue ma być podstawą do przygotowania specyfikacji.

## Zasady ogólne

1. Issue ma opisywać problem i oczekiwany efekt, nie tylko preferowaną implementację.
2. Brakujące dane wypisz w punktach jako listę braków.
3. Nie uzupełniaj niepewnych informacji własnymi założeniami, jeśli mogą zmienić zakres pracy.
4. Jeżeli decyzja człowieka jest konieczna, zadaj jedno konkretne pytanie naraz.
5. Jeżeli issue jest wystarczające do pracy, napisz to wprost i wskaż minimalny kolejny krok.

## Issue typu Bug

Issue typu Bug powinno zawierać:

1. Opis faktycznego problemu.
2. Wpływ na użytkownika, dane, proces albo system.
3. Kroki odtworzenia.
4. Oczekiwany wynik.
5. Faktyczny wynik.
6. Środowisko, wersję, branch, commit albo inny punkt odniesienia.
7. Logi, komunikaty błędów, screenshoty albo linki do monitoringu, jeśli istnieją.

## Issue typu Feature

Issue typu Feature powinno zawierać:

1. Cel biznesowy albo użytkowy.
2. Kontekst obecnego ograniczenia.
3. Zakres oczekiwanej zmiany.
4. Przypadki użycia.
5. Kryteria akceptacji.
6. Wstępny sposób weryfikacji.
7. Elementy poza zakresem, jeśli mogłyby być mylące.

## Issue typu Task

Issue typu Task powinno zawierać:

1. Kontekst zadania.
2. Zakres prac.
3. Warunek ukończenia.
4. Sposób weryfikacji.
5. Ryzyka albo zależności, jeśli występują.

## Wstępna specyfikacja dla issue

Jeżeli issue wymaga specyfikacji, przygotuj ją tak, aby obejmowała:

1. Cel.
2. Zakres.
3. Przypadki użycia.
4. Wymagania funkcjonalne.
5. Przypadki brzegowe.
6. Wpływ na istniejący system.
7. Kryteria akceptacji.
8. Plan walidacji.
9. Ryzyka i rollback.

Jeżeli projekt nie ma własnej decyzji o miejscu specyfikacji, użyj `docs/specs/` i szablonu `docs/specs/_template.md`.

## Weryfikacja istniejącego issue

1. Ustal typ issue:
   a) Bug
   b) Feature
   c) Task
2. Porównaj treść issue z checklistą dla danego typu.
3. Wypisz braki jako listę punktów.
4. Oznacz elementy blokujące realizację.
5. Jeżeli brakuje tylko drobnych danych, wskaż je jako uzupełnienie, ale nie blokuj pracy bez powodu.

## Format odpowiedzi przy brakach

```md
Issue nie jest jeszcze kompletne do realizacji.

Brakuje:
1. ...
2. ...

Blokujące:
1. ...

Pytanie:
1. ...
```

## Format odpowiedzi przy komplecie

```md
Issue jest kompletne do dalszej pracy.

Następny krok:
1. Przygotować specyfikację w `docs/specs/` albo rozpocząć implementację, jeśli proces projektu na to pozwala.
```
