# AGENTS - docs/apis

Ten plik jest mapą dokumentacji integracji API.

## Cel katalogu `docs/apis/`

- Przechowywanie dokumentacji technicznej dotyczącej integracji API.
- Utrzymanie jednego miejsca dla konfiguracji, endpointów i procedur API.

## Mapa plików

- `docs/apis/AGENTS.md`
  - Indeks i zasady prowadzenia dokumentacji API.
- `docs/apis/*.md`
  - Dokumenty integracji API (jeden plik na integrację lub obszar).
- `docs/apis/Forgejo-API.md`
  - Notatki operacyjne i konfiguracja integracji z Forgejo API.
- `docs/apis/GitHub-API.md`
  - Notatki operacyjne i konfiguracja integracji z GitHub API.

## Zasady prowadzenia dokumentacji API

- Twórz jeden plik na jedną integrację API albo spójny obszar API.
- Stosuj nazwy opisowe, np. `Forgejo-API.md`, `Payments-API.md`.
- Każdy plik API powinien zawierać:
  - zakres integracji,
  - sposób autoryzacji,
  - konfigurację środowiska,
  - najważniejsze endpointy i operacje,
  - wymagania bezpieczeństwa.
- Po dodaniu nowego pliku dopisz go do sekcji "Mapa plików" w tym dokumencie.
