# Runbook: atomowe commity

## Cel i zakres

Ustandaryzować wykonywanie poleceń `c`, `c+p`, `c+p+pr` tak, aby zmiany były dzielone na małe, logicznie spójne commity zgodnie ze specyfikacją `docs/specs/atomowe-commity.md` (issue `#12`).

## Wymagania wejściowe

- Dostęp do lokalnego repozytorium Git z przygotowanymi zmianami.
- Znajomość celu zadania i powiązanej specyfikacji/issue.
- Zgoda człowieka na commit/push zgodnie z globalnymi zasadami `AGENTS.md`.

## Kroki wykonania

1. Sprawdź stan zmian (`git status`, `git diff`) i oceń, czy dotyczą jednego czy wielu niezależnych celów.
2. Wyodrębnij grupy zmian do osobnych commitów:
   - osobno refaktor przygotowawczy (bez zmiany zachowania),
   - osobno zmiany funkcjonalne (fix/feature),
   - osobno dokumentacja/testy/kosmetyka, jeśli da się je reviewować niezależnie.
3. Dla każdej grupy przygotuj commit obejmujący tylko powiązane pliki/hunki.
4. Nadaj komunikat commita odpowiadający dokładnie jego zawartości.
5. Jeśli część zmian jest WIP lub niebezpieczna do commitowania, pozostaw ją poza commitami.
6. Przy `c+p` oraz `c+p+pr` wykonaj jeden push dopiero po przygotowaniu całej serii commitów.

## Kroki weryfikacji

1. Sprawdź historię (`git log --oneline --decorate -n <N>`) i potwierdź, że każdy commit ma jeden cel logiczny.
2. Sprawdź zawartość commitów (`git show --name-only <sha>`) i potwierdź brak mieszania niepowiązanych zmian.
3. Potwierdź kolejność commitów: refaktor -> fix/feature -> docs/testy (jeśli dotyczy).
4. W podsumowaniu opisz:
   - listę commitów,
   - uzasadnienie podziału,
   - listę pozostawionych zmian (jeśli występują).

## Typowe błędy i reakcja

- Błąd: Jeden zbiorczy commit zawiera różne intencje.
  - Reakcja: Rozdziel zmiany na logiczne grupy i wykonaj osobne commity.
- Błąd: Komunikat commita jest szerszy niż faktyczny zakres zmian.
  - Reakcja: Popraw komunikat, aby opisywał realną zawartość commita.
- Błąd: WIP trafia do commita.
  - Reakcja: Cofnij WIP z indeksu i zostaw go poza serią commitów.
