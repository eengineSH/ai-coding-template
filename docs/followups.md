# Follow-ups

Ten plik jest operacyjnym rejestrem cyklicznych lub odłożonych kontroli.

## Statusy

- `OK` - zadanie wykonane poprawnie.
- `WARN` - zadanie wykonane, ale wykryto odchylenie.
- `FAIL` - zadanie wykonane i wykryto błąd wymagający reakcji.
- `PENDING` - brak pierwszego uruchomienia.

## Rejestr zadań

| ID zadania | Priorytet | Częstotliwość | Ostatnie uruchomienie | Ostatni status | Następny deadline |
| --- | --- | --- | --- | --- | --- |
| EXAMPLE_TASK | Standard | co tydzień | - | PENDING | - |

## Szablon nowego zadania

Każde kolejne zadanie dodawaj jako osobną sekcję:

1. `### TASK_ID`
2. Metadane zadania:
   a) opis
   b) harmonogram
   c) zakres
   d) kryteria kontroli
   e) reguła alarmowa
3. Checklista kontrolna.
4. Historia uruchomień.
5. Pełny wynik ostatniego uruchomienia.

### EXAMPLE_TASK

- Opis:
  - przykładowa kontrola do zastąpienia pierwszym realnym zadaniem projektu.
- Harmonogram:
  - co tydzień.
- Zakres:
  - do ustalenia przez projekt.
- Kryteria kontroli:
  - wynik jest kompletny.
  - wynik jest możliwy do zweryfikowania.
- Reguła alarmowa:
  - przy statusie `FAIL` zgłoś problem w domyślnym trackerze projektu.

#### Checklista kontrolna

1. Ustal zakres kontroli.
2. Wykonaj kontrolę.
3. Zapisz wynik w historii.
4. Zaktualizuj rejestr zadań.

#### Historia uruchomień

| Data uruchomienia | Status | Szczegóły | Akcja |
| --- | --- | --- | --- |
| - | PENDING | Brak uruchomienia | Uzupełnić po pierwszej kontroli |

#### Pełny wynik ostatniego uruchomienia

- Brak.
