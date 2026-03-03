# Specyfikacja: atomowe, logiczne commity (issue #12)

## Kontekst

- Źródło: GitHub issue `#12` "Rozbijanie commitów na atomowe, logiczne części".
- Data przygotowania: `2026-03-03`.
- Obszar: workflow commitowania zmian przygotowywanych przez agenta.

## Cel biznesowy

Zwiększyć czytelność historii Git i jakość review przez wymuszenie dzielenia zmian na możliwie małe, logicznie spójne commity, zamiast jednego zbiorczego commita.

## Zakres

### W zakresie

- Przygotowanie wielu commitów w ramach jednego polecenia użytkownika dotyczącego commita.
- Grupowanie zmian według logicznego celu (np. fix, refaktor, docs, testy).
- Nadawanie opisów commitów zgodnych z rzeczywistą zawartością.
- Możliwość wykonania jednego `push`, który publikuje serię atomowych commitów.

### Poza zakresem

- Zmiana strategii merge na GitHubie.
- Automatyczne przepisywanie historii po `push`.
- Zmiana zasad branchowania innych niż wynikające z istniejących wytycznych repo.

## Definicje

- Commit atomowy: commit zawierający jedną logiczną zmianę, możliwą do zrozumienia i review bez kontekstu innych niepowiązanych modyfikacji.
- Zmiana niepowiązana: modyfikacja należąca do innego celu niż dominujący cel danego commita (np. poprawka błędu razem z refaktorem bez bezpośredniego związku).

## Wymagania funkcjonalne

1. Gdy użytkownik prosi o commit i zestaw zmian obejmuje więcej niż jeden niezależny cel, agent MUSI przygotować co najmniej dwa commity.
2. Agent MUSI najpierw przeanalizować diff i wyodrębnić logiczne grupy zmian przed wykonaniem pierwszego commita.
3. Każdy commit MUSI zawierać wyłącznie pliki i hunki związane z jednym celem logicznym.
4. Agent NIE MOŻE łączyć w jednym commicie zmian typu `fix + refaktor + docs`, chyba że wszystkie dotyczą tej samej, nierozdzielnej poprawki.
5. Komunikat commita MUSI opisywać realną zawartość commita i nie może sugerować szerszego zakresu niż faktycznie zacommitowany.
6. Jeśli część zmian nie nadaje się do bezpiecznego zacommitowania (np. work in progress), agent MUSI je pozostawić poza commitami i jasno to zgłosić w podsumowaniu.
7. Jeśli użytkownik prosi o `c+p` lub `c+p+pr`, agent może wykonać jeden `push`, ale dopiero po przygotowaniu kompletnej serii atomowych commitów.

## Reguły decyzyjne (jednoznaczność implementacyjna)

1. Jeden commit jest dopuszczalny tylko wtedy, gdy wszystkie zmiany dotyczą jednego celu i nie dają się sensownie rozdzielić bez utraty spójności.
2. Co najmniej dwa commity są wymagane, gdy spełniony jest przynajmniej jeden warunek:
   - zmiany dotyczą różnych warstw (np. logika + dokumentacja) i mogą być reviewowane niezależnie,
   - zmiany mają różne intencje (np. bugfix i porządki),
   - da się wskazać oddzielny commit testów lub dokumentacji bez łamania działania kodu.
3. Kolejność commitów powinna minimalizować ryzyko regresji:
   - najpierw zmiany przygotowujące (np. refaktor bez zmiany zachowania),
   - potem zmiany funkcjonalne (fix/feature),
   - na końcu dokumentacja i kosmetyka.

## Przypadki brzegowe

- Zmiana jednego pliku może nadal wymagać wielu commitów, jeśli zawiera różne logiczne modyfikacje.
- Jeśli testy zależą od fixa, testy mogą trafić do tego samego commita co fix; oddzielny commit testów jest opcjonalny.
- Jeśli rozdzielenie hunka grozi uszkodzeniem działania, dopuszczalne jest zachowanie całości w jednym commicie z uzasadnieniem.
- Jeśli repo zawiera ręczne, obce zmiany użytkownika, agent nie cofa ich i nie miesza ich automatycznie do commitów bez potwierdzonego związku z celem.

## Kryteria akceptacji

1. Dla zadania zawierającego co najmniej dwa niezależne cele powstają minimum dwa commity.
2. Każdy commit ma opis odpowiadający faktycznie zawartym zmianom.
3. Brak commitów mieszających niepowiązane cele zmian.
4. Końcowe podsumowanie agenta zawiera listę utworzonych commitów i krótkie uzasadnienie podziału.
5. `push` (jeśli wykonywany) publikuje serię przygotowanych commitów bez scalania ich w jeden commit.

## Wpływ na istniejące elementy systemu

- AGENTS/workflow commitów: doprecyzowanie reguł podziału zmian.
- Jakość review: mniejsze, bardziej czytelne PR-y i prostszy rollback.
- Historia repo: większa granularność, lepsza audytowalność intencji zmian.

## Plan weryfikacji

1. Scenariusz A (fix + docs): oczekiwane 2 commity (`fix`, `docs`).
2. Scenariusz B (refaktor przygotowawczy + fix): oczekiwane 2 commity w kolejności `refaktor`, potem `fix`.
3. Scenariusz C (pojedyncza, nierozdzielna poprawka): oczekiwany 1 commit z uzasadnieniem nierozdzielności.
4. Scenariusz D (`c+p`): oczekiwane wiele commitów i jeden `push`.

## Historia zmian

- `2026-03-03`: utworzenie pierwszej wersji specyfikacji na podstawie issue `#12`.
