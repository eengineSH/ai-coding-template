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

1. Sklonuj repozytorium albo użyj go jako template’u.
2. Podmień nazwę projektu, ownera i repozytorium w plikach konfiguracyjnych oraz dokumentacji.
3. Zdecyduj, czy projekt używa GitHub, Forgejo czy obu integracji.
4. Uzupełnij `.env.example` o właściwe zmienne dla projektu.
5. Usuń integracje, których projekt nie będzie używał.
6. Dopisz pierwszą specyfikację w `docs/specs/` albo podlinkuj issue, jeśli praca startuje z issue.
7. Uzupełnij sekcję "Uruchomienie" o konkretne komendy projektu.
8. Dodaj testy i CI, jeśli projekt będzie rozwijany długoterminowo.

## Adaptacja do projektu

1. `AGENTS.md`
   - zostaw tylko zasady, które mają obowiązywać w danym projekcie
   - przenieś lokalne zasady do najbliższego folderu, którego dotyczą
2. `.github/`
   - dopasuj szablony issue, PR i instrukcje Copilota do technologii projektu
   - usuń sekcje, które nie mają zastosowania
3. `docs/specs/`
   - trzymaj kompletne specyfikacje zmian, jeśli projekt wymaga specyfikowania przed kodowaniem
4. `docs/runbooks/`
   - dopisuj tylko powtarzalne procedury, które naprawdę będą używane
5. `docs/skills/`
   - zostaw puste, dopóki projekt nie potrzebuje własnych skilli agenta

## Uruchomienie

Brak zdefiniowanej aplikacji na tym etapie. Uzupełnij tę sekcję po dodaniu kodu.

## Licencja

Do ustalenia.
