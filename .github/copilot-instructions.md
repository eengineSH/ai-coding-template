# Instrukcje dla GitHub Copilot

Obowiązują w tym repozytorium przy generowaniu kodu, komentarzy i code review.

## Język

- Komunikacja projektowa jest po polsku.
- Komentarze review pisz jasno i konkretnie.

## Priorytety review

1. Błędy funkcjonalne i regresje.
2. Ryzyka bezpieczeństwa.
3. Brakujące testy lub weryfikacja.
4. Niezgodność z istniejącymi wzorcami projektu.
5. Nadmierna złożoność lub zmiany poza zakresem.

## Zasady oceny

- Nie zgłaszaj uwag kosmetycznych, jeśli nie wpływają na czytelność, utrzymanie albo działanie.
- Każda uwaga powinna wskazywać konkretny problem i praktyczny sposób naprawy.
- Gdy problem dotyczy testów, wskaż jaki scenariusz powinien zostać sprawdzony.
- Gdy sugerujesz zmianę architektury, wyjaśnij trade-off.
- Nie proponuj przepisywania większych fragmentów bez jasnego powodu.

## Dokumentacja

- `AGENTS.md` zawiera zasady dla agentów.
- `README.md` jest dla człowieka.
- `docs/specs/` zawiera specyfikacje zmian.
- `docs/runbooks/` zawiera powtarzalne procedury operacyjne.
