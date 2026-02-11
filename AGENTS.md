# AGENTS

Ten plik definiuje podstawowe zasady dla agentów (AI i automatyzacji) pracujących w tym repozytorium.

## Język projektu

- Cała komunikacja w projekcie odbywa się w języku polskim.
- Dotyczy to w szczególności: dokumentacji, opisów zmian, nazewnictwa i treści commitów oraz komunikacji między członkami zespołu i agentami.

## Zakres

- Wprowadzaj zmiany minimalne i zgodne z aktualnym celem zadania.
- Nie modyfikuj plików niezwiązanych z zadaniem.
- Nie usuwaj istniejącej funkcjonalności bez wyraźnego powodu i opisu.

## Jakość zmian

- Preferuj czytelność i prostotę nad nadmierną złożonością.
- Po zmianach uruchamiaj dostępne testy/lintery.
- Gdy brak testów, opisz krótko jak zweryfikowano poprawność zmian.

## Dokumentacja

- Dla agenta źródłem prawdy są pliki `AGENTS.md`.
- Informacje dla agentów zapisuj w `AGENTS.md` najbliższym zakresowi danej funkcji/obszaru; globalny `AGENTS.md` traktuj jako miejsce na zasady przekrojowe, gdy nie ma bardziej adekwatnego pliku.
- Szczegóły techniczne integracji (np. API, tokeny, workflow agenta) zapisuj w `docs/`.
- Indeks dokumentacji technicznej znajduje się w `docs/AGENTS.md` (tam szukaj informacji, co jest w `docs/` i po co).
- Dokumentacji integracji API szukaj w `docs/apis/`, a ich indeks i zasady w `docs/apis/AGENTS.md`.
- Specyfikacji funkcjonalności szukaj w `docs/specs/`, a ich indeks i zasady w `docs/specs/AGENTS.md`.
- Runbooków operacyjnych szukaj w `docs/runbooks/`, a ich indeks i zasady w `docs/runbooks/AGENTS.md`.
- Nazwy plików instrukcji zapisuj dokładnie jako `AGENTS.md` (wielkie `AGENTS`, małe `.md`).
- W plikach `AGENTS.md` nie twórz odniesień do plików `README.md`.
- W każdym folderze projektu powinien istnieć plik `README.md` opisujący zawartość folderu oraz informacje o podkatalogach.
- Dodawaj krótkie komentarze tylko tam, gdzie logika nie jest oczywista.

## Komunikacja zmian

- W podsumowaniu podawaj:
  - co zostało zmienione,
  - dlaczego,
  - jak to zweryfikowano.

## Interpretacja poleceń

- Zakładaj, że człowiek może popełniać literówki i używać skrótów myślowych.
- Nie podążaj ślepo za nieprecyzyjnym zapisem, tylko prostuj intencję na podstawie dostępnej wiedzy (w pierwszej kolejności dokumentacji projektowej).
- Dopytuj użytkownika dopiero wtedy, gdy po takiej próbie pozostaje więcej niż jedna sensowna interpretacja.

## Zgody i uprawnienia

- Commit/push wykonuj tylko po wyraźnej zgodzie człowieka. Nigdy nie commituj ani nie pushuj samodzielnie.
- `sudo`: korzystaj z `sudo` tylko po wyraźnej zgodzie człowieka.

## Nadpisywanie wytycznych

- Jeśli człowiek każe zrobić coś, co jest sprzeczne z `AGENTS.md`:
  - nie blokuję pracy
  - zadaję jedno pytanie potwierdzające, czy wykonać to pomimo wytycznych
  - po potwierdzeniu wykonuję polecenie
  - w odpowiedzi wskazuję, które wytyczne zostały nadpisane

## Ręczne zmiany człowieka

- Jeśli widzę zmiany w repo, których nie zrobiłem (np. ręczna edycja pliku przez człowieka):
  - nie cofam ich automatycznie
  - traktuję je jako intencjonalne
  - mogę je wskazać/oznaczyć w odpowiedzi jako wykryte, ale bez samodzielnego odkręcania

## GitHub / Forgejo

### Repozytorium i narzędzia

- Adres HTTPS repozytorium: `https://git.iphoenix.pl/fizol/ai-coding-template`.
- Oprogramowanie hostujące: `Forgejo`.
- Wersja Forgejo: `13.0.2+gitea-1.22.0`.
- Operacje na issues wykonujemy przez API Forgejo (skrypt `scripts/forgejo-issues.sh`).

### Skróty poleceń

- `c`
  - commit (bez push)
- `c+p`
  - commit i push
- `c+p+pr`
  - commit i push
  - utworzenie PR
- `rc #NNN`
  - przejrzenie komentarzy w PR `#NNN`
  - uwzględnienie komentarzy w rozwiązaniu
- `rc`
  - jak wyżej, ale dla aktualnego lub ostatniego PR
  - jeśli nie da się jednoznacznie ustalić PR, pytam o numer

### Specyfikacje a issue

- Jeśli zadanie ma issue na Forgejo i wymaga specyfikacji, to specyfikacja ma powstać jako komentarz do danego issue (nie w `docs/specs/`).
- Jeśli specyfikacja jest w komentarzu i prosisz o jej poprawę, edytuję istniejący komentarz (nie dodaję nowego).
- Jeśli nie ma issue, a potrzebna jest specyfikacja, to najpierw pytam gdzie ją umieścić (issue vs `docs/specs/`) i czy wcześniej nie założyć pod to nowego issue.

### Issue (tworzenie i triage)

- Przy zgłaszaniu bugów nie pomijam szczegółów z opisu (dokładne komendy/skrypty, pełny komunikat błędu).

### PR i branchowanie (Git Flow)

- Domyślnie pracuję na branchu i zmiany wchodzą do `main` przez Pull Request.
- Poza sytuacjami wyjątkowymi nie robię commitów bezpośrednio do `main`.
  - jeśli człowiek prosi o commit/push do `main`, traktuję to jako nadpisanie tej zasady (patrz zasada `Nadpisywanie wytycznych`)
- Każdy commit ma nazwę i krótki opis zmian.
- Opis commita zawiera informację, na podstawie jakiej specyfikacji wykonano pracę (plik/spec lub issue) i zawiera do niej odniesienie.
