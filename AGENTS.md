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

- Przy starcie nowego kontekstu najpierw sprawdź `docs/followups.md`, jeśli plik istnieje.
- Dla agenta źródłem prawdy są pliki `AGENTS.md`.
- Informacje dla agentów zapisuj w `AGENTS.md` najbliższym zakresowi danej funkcji/obszaru; globalny `AGENTS.md` traktuj jako miejsce na zasady przekrojowe, gdy nie ma bardziej adekwatnego pliku.
- Szczegóły techniczne integracji (np. API, tokeny, workflow agenta) zapisuj w `docs/`.
- Indeks dokumentacji technicznej znajduje się w `docs/AGENTS.md` (tam szukaj informacji, co jest w `docs/` i po co).
- Dokumentacji integracji API szukaj w `docs/apis/`, a ich indeks i zasady w `docs/apis/AGENTS.md`.
- Specyfikacji funkcjonalności szukaj w `docs/specs/`, a ich indeks i zasady w `docs/specs/AGENTS.md`.
- Runbooków operacyjnych szukaj w `docs/runbooks/`, a ich indeks i zasady w `docs/runbooks/AGENTS.md`.
- Skille agenta, jeśli projekt zdecyduje się ich używać, opisuj w `docs/skills/`.
- Nazwy plików instrukcji zapisuj dokładnie jako `AGENTS.md` (wielkie `AGENTS`, małe `.md`).
- W plikach `AGENTS.md` nie twórz odniesień do plików `README.md`.
- W każdym folderze projektu powinien istnieć plik `README.md` opisujący zawartość folderu oraz informacje o podkatalogach.
- Pliki `AGENTS.md` są przeznaczone dla agentów i automatyzacji.
- Pliki `README.md` są przeznaczone dla człowieka.
- Nie duplikuj semantycznie tych samych zasad w `AGENTS.md` i `README.md`; jeśli trzeba coś doprecyzować, ujednolić istniejący wpis zamiast dopisywać równoległy.
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

- Główne repozytorium ustalaj z `git remote -v`.
- Oprogramowanie hostujące rozpoznawaj po `origin` albo po wskazaniu człowieka.
- Operacje na issues wykonujemy przez API:
  - GitHub (domyślnie): `scripts/github-issues.sh`
  - Forgejo (gdy dotyczy repo na Forgejo): `scripts/forgejo-issues.sh`
- Sekrety i tokeny ładuj przez helper `scripts/load_env.sh` albo przez jawnie wskazane zmienne środowiskowe; nie wypisuj tokenów na stdout.

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

- Jeśli zadanie ma issue i wymaga specyfikacji, dopasuj miejsce specyfikacji do zasad projektu.
- Gdy projekt nie ma własnej decyzji, domyślnym miejscem roboczym jest `docs/specs/`.
- Specyfikacja nie oznacza automatycznej zgody na implementację, jeśli człowiek nie poprosił wprost o realizację.

### Issue (tworzenie i triage)

- Przy zgłaszaniu bugów nie pomijam szczegółów z opisu (dokładne komendy/skrypty, pełny komunikat błędu).
- Przy tworzeniu albo weryfikacji issue stosuj runbook `docs/runbooks/006-przygotowanie-issue-i-specyfikacji.md`.
- Jeśli istniejące issue jest niekompletne, wypisz brakujące elementy w punktach zamiast zgadywać.
- Issue powinno mieć cel, kontekst, zakres, kryteria akceptacji albo warunek ukończenia oraz sposób weryfikacji odpowiedni do typu zgłoszenia.

### PR i branchowanie (Git Flow)

- Domyślnie pracuję na branchu i zmiany wchodzą do `main` przez Pull Request.
- Poza sytuacjami wyjątkowymi nie robię commitów bezpośrednio do `main`.
  - jeśli człowiek prosi o commit/push do `main`, traktuję to jako nadpisanie tej zasady (patrz zasada `Nadpisywanie wytycznych`)
- Każdy commit przygotowuję jako możliwie mały i atomowy; zasada dotyczy także commitów inicjowanych skrótami (`c`, `c+p`, `c+p+pr`).
- Każdy commit ma nazwę i krótki opis zmian.
- Opis commita zawiera informację, na podstawie jakiej specyfikacji wykonano pracę (plik/spec lub issue) i zawiera do niej odniesienie.
