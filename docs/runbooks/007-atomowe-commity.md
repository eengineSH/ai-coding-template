# Runbook: atomowe commity

## Cel

Dzielić zmiany na małe, logicznie spójne commity, które ułatwiają review, rollback i analizę historii.

## Kiedy używać

1. Przy każdym poleceniu `c`, `c+p` albo `c+p+pr`.
2. Przy kończeniu zadania obejmującego więcej niż jeden typ zmiany.
3. Przed wypchnięciem brancha z większym zakresem prac.

## Zasady

1. Jeden commit powinien zawierać jedną logiczną zmianę.
2. Nie mieszaj w jednym commicie niepowiązanych obszarów.
3. Jeżeli zmiana dokumentacji opisuje dokładnie tę samą zmianę kodu, może być w tym samym commicie.
4. Jeżeli dokumentacja, konfiguracja albo testy dotyczą niezależnego tematu, zrób osobny commit.
5. Jeden push może zawierać serię kilku atomowych commitów.
6. Nie twórz sztucznie małych commitów, które osobno nie mają sensu.

## Typowe granice commitów

1. Zmiana funkcjonalna.
2. Testy dla tej zmiany.
3. Migracja lub zmiana schematu danych.
4. Dokumentacja procesu albo runbook.
5. Konfiguracja narzędzi.
6. Refaktor bez zmiany zachowania.
7. Poprawka po review.

## Procedura

1. Sprawdź stan repo:

```sh
git status --short
```

2. Zobacz pełny zakres zmian:

```sh
git diff
git diff --stat
```

3. Podziel zmiany na logiczne grupy.
4. Dla każdej grupy zdecyduj:
   a) jaki problem rozwiązuje
   b) jakie pliki do niej należą
   c) czy commit będzie samodzielnie zrozumiały
5. Dodawaj pliki albo hunki selektywnie:

```sh
git add <plik>
git add -p <plik>
```

6. Przed każdym commitem sprawdź staged diff:

```sh
git diff --cached --stat
git diff --cached
```

7. Utwórz commit z nazwą i krótkim opisem:

```sh
git commit -m "Krótka nazwa zmiany" -m "Opis zakresu i powodu zmiany." -m "Specyfikacja: <plik albo issue>."
```

8. Powtarzaj kroki dla kolejnych grup.
9. Po ostatnim commicie sprawdź historię:

```sh
git log --oneline --decorate -5
git status --short
```

10. Wypchnij serię commitów jednym pushem, jeśli człowiek o to poprosił:

```sh
git push
```

## Weryfikacja

1. Każdy commit ma jeden temat.
2. Żaden commit nie miesza niepowiązanych zmian.
3. Nazwa i opis commita odpowiadają rzeczywistej zawartości.
4. Seria commitów odtwarza tok pracy w kolejności logicznej.
5. Working tree po commitach nie zawiera przypadkowych zmian.

## Przykłady

### Dobrze

1. `Dodaj szablony issue`
2. `Opisz procedurę przygotowania issue`
3. `Dodaj runbook atomowych commitów`

### Źle

1. `Zmiany`
2. `Update`
3. Jeden commit zawierający równocześnie:
   a) refaktor kodu
   b) poprawkę buga
   c) nowy runbook
   d) zmianę konfiguracji CI
