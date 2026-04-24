# AI Coding Template

Repozytorium startowe dla projektów, w których człowiek i agenci AI mają pracować w przewidywalny sposób.

## Zawartość

- `AGENTS.md` - zasady pracy dla agentów i automatyzacji.
- `.github/` - szablony GitHuba, Pull Requestów, issue, instrukcje Copilota i pliki community health.
- `docs/` - dokumentacja operacyjna i techniczna projektu.
- `docs/apis/` - dokumentacja integracji API.
- `docs/specs/` - specyfikacje zmian i funkcjonalności.
- `docs/runbooks/` - syntetyczne procedury operacyjne.
- `docs/skills/` - puste miejsce na przyszłe skille agenta.
- `scripts/` - helpery do pracy z API i środowiskiem.

## Szybki start

Najprostszy sposób użycia tego repo polega na wkomponowaniu template’u w realne repo projektu przez agenta AI.

1. Utwórz nowe repozytorium projektu na GitHubie albo użyj istniejącego repozytorium.
2. Sklonuj repozytorium projektu na dysk lokalny.
3. Otwórz lokalne repozytorium w edytorze z agentem kodującym, np. Visual Studio Code z Codexem albo analogicznym narzędziem.
4. Uruchom agenta w katalogu docelowego repozytorium.
5. Przekaż agentowi polecenie:

```text
Przeanalizuj bieżące repozytorium i wkomponuj w nie szablon pracy agentowej z https://github.com/eengineSH/ai-coding-template.

Zachowaj istniejącą strukturę i nie nadpisuj ręcznych zmian bez pytania. Dopasuj pliki AGENTS.md, README.md, .github, docs i scripts do technologii, hostingu, procesu pracy i zasad tego projektu. Usuń elementy template’u, które nie mają zastosowania. W miejscach wymagających decyzji człowieka zatrzymaj się i zadaj jedno konkretne pytanie naraz.
```

6. Po adaptacji przejrzyj zmiany z agentem.
7. Usuń albo doprecyzuj wszystkie placeholdery, które nie mają realnego znaczenia w projekcie.
8. Zacommituj dopiero zaakceptowany zakres.

Alternatywnie możesz użyć GitHuba i opcji "Use this template", jeśli tworzysz repo od zera i chcesz świadomie zacząć od tej struktury bez automatycznej adaptacji do istniejącego kodu.

## Adaptacja do projektu

Podczas adaptacji nie chodzi o mechaniczne skopiowanie wszystkich plików. Celem jest dopasowanie zasad pracy agentowej do konkretnego projektu.

1. `AGENTS.md`
   a) zostaw tylko zasady, które mają obowiązywać w projekcie
   b) dopisz język komunikacji, git flow, zasady commitów, proces specyfikacji i ograniczenia środowiskowe
   c) przenieś zasady lokalne do najbliższego folderu, którego dotyczą
   d) unikaj duplikatów semantycznych między głównym `AGENTS.md` i plikami podrzędnymi
2. `.github/`
   a) dopasuj szablony issue do realnego procesu triage
   b) dopasuj Pull Request template do wymaganej weryfikacji
   c) uzupełnij instrukcje Copilota o technologie, wersje środowiska i zasady code review
   d) usuń `CODEOWNERS`, `SECURITY.md`, `SUPPORT.md`, Dependabot albo inne pliki, jeśli projekt nie ma dla nich realnej treści
3. `docs/specs/`
   a) zostaw, jeśli projekt wymaga specyfikacji przed implementacją
   b) ustal schemat numeracji i kryteria akceptacji
   c) usuń katalog, jeśli projekt prowadzi specyfikacje wyłącznie w issue
4. `docs/runbooks/`
   a) dopisuj tylko powtarzalne procedury, które naprawdę będą używane
   b) usuwaj runbooki generyczne, jeśli nie pasują do procesu projektu
5. `docs/apis/`
   a) zostaw dokumentację tylko tych integracji, których projekt używa
   b) usuń GitHub albo Forgejo, jeśli nie są potrzebne
6. `docs/skills/`
   a) zostaw puste, dopóki projekt nie potrzebuje własnych skilli agenta
   b) dodawaj skille dopiero dla powtarzalnych workflow
7. `scripts/`
   a) zostaw helpery, które będą realnie używane
   b) usuń skrypty związane z niewykorzystywanymi integracjami
8. `.env.example`
   a) uzupełnij tylko zmienne konfiguracyjne bez sekretów
   b) usuń zmienne dla nieużywanych integracji

## Uruchomienie

Ten template nie definiuje aplikacji do uruchomienia. Po adaptacji do projektu ta sekcja w repo docelowym powinna zostać zastąpiona konkretną instrukcją.

Minimalnie opisz:

1. wymagane wersje języka, runtime’u, bazy i narzędzi
2. sposób instalacji zależności
3. sposób przygotowania konfiguracji lokalnej
4. komendę startu aplikacji
5. komendy testów, linterów i podstawowej walidacji
6. najważniejsze URL-e albo entrypointy lokalnego środowiska

Jeśli projekt nie jest aplikacją, opisz główny sposób użycia repozytorium, np. komendy CLI, workflow dokumentacyjne albo procedury operacyjne.

## Licencja

MIT. Szczegóły w pliku `LICENSE`.
