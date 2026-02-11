#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "help" || "${1:-}" == "-h" || "${1:-}" == "--help" || $# -eq 0 ]]; then
  cat <<'USAGE'
Uzycie:
  scripts/github-issues.sh whoami
  scripts/github-issues.sh issues-list [open|closed|all]
  scripts/github-issues.sh issue-get <nr>
  scripts/github-issues.sh issue-create <tytul> <opis>
  scripts/github-issues.sh issue-comment <nr> <komentarz>
  scripts/github-issues.sh issue-open <nr>
  scripts/github-issues.sh issue-close <nr>

Wymagane zmienne srodowiskowe:
  GITHUB_BASE_URL  np. https://api.github.com
  GITHUB_OWNER     np. eEngineSoftwareHouse
  GITHUB_REPO      np. ansible
  GITHUB_TOKEN     token API GitHub
USAGE
  exit 0
fi

for cmd in curl jq; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Brak wymaganego narzedzia: $cmd" >&2
    exit 1
  fi
done

: "${GITHUB_BASE_URL:?Brak GITHUB_BASE_URL}"
: "${GITHUB_OWNER:?Brak GITHUB_OWNER}"
: "${GITHUB_REPO:?Brak GITHUB_REPO}"
: "${GITHUB_TOKEN:?Brak GITHUB_TOKEN}"

if [[ "${GITHUB_TOKEN}" == wklej_* ]]; then
  echo "GITHUB_TOKEN wyglada na placeholder. Ustaw prawidlowy token API GitHub w .env." >&2
  exit 1
fi

BASE="${GITHUB_BASE_URL%/}"
REPO_PATH="/repos/${GITHUB_OWNER}/${GITHUB_REPO}"

api() {
  local method="$1"
  local path="$2"
  local body="${3:-}"

  if [[ -n "$body" ]]; then
    curl -fsS \
      -X "$method" \
      -H "Authorization: Bearer ${GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      -H "Content-Type: application/json" \
      "${BASE}${path}" \
      -d "$body"
  else
    curl -fsS \
      -X "$method" \
      -H "Authorization: Bearer ${GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "${BASE}${path}"
  fi
}

command_name="$1"
shift || true

case "$command_name" in
  whoami)
    api GET "/user" | jq '{login, name, email}'
    ;;
  issues-list)
    state="${1:-open}"
    all_items='[]'
    for page in 1 2 3 4 5; do
      page_items="$(api GET "${REPO_PATH}/issues?state=${state}&sort=updated&direction=desc&per_page=100&page=${page}")"
      page_count="$(echo "${page_items}" | jq 'length')"
      all_items="$(jq -nc --argjson a "${all_items}" --argjson b "${page_items}" '$a + $b')"
      if [[ "${page_count}" -lt 100 ]]; then
        break
      fi
    done
    echo "${all_items}" | jq '[.[] | select(.pull_request|not) | {number, title, state, updated_at}]'
    ;;
  issue-get)
    number="${1:?Podaj numer issue}"
    api GET "${REPO_PATH}/issues/${number}" | jq '{number, title, body, state, user: .user.login, assignees: [(.assignees // [])[]?.login], labels: [(.labels // [])[]?.name], updated_at}'
    ;;
  issue-create)
    title="${1:?Podaj tytul issue}"
    body_text="${2:?Podaj opis issue}"
    payload="$(jq -nc --arg title "$title" --arg body "$body_text" '{title:$title, body:$body}')"
    api POST "${REPO_PATH}/issues" "$payload" | jq '{number, title, state, html_url}'
    ;;
  issue-comment)
    number="${1:?Podaj numer issue}"
    comment="${2:?Podaj tresc komentarza}"
    payload="$(jq -nc --arg body "$comment" '{body:$body}')"
    api POST "${REPO_PATH}/issues/${number}/comments" "$payload" | jq '{id, user: .user.login, body, created_at}'
    ;;
  issue-open)
    number="${1:?Podaj numer issue}"
    payload='{"state":"open"}'
    api PATCH "${REPO_PATH}/issues/${number}" "$payload" | jq '{number, title, state, updated_at}'
    ;;
  issue-close)
    number="${1:?Podaj numer issue}"
    payload='{"state":"closed"}'
    api PATCH "${REPO_PATH}/issues/${number}" "$payload" | jq '{number, title, state, updated_at}'
    ;;
  *)
    echo "Nieznana komenda: ${command_name}" >&2
    echo "Uruchom: scripts/github-issues.sh --help" >&2
    exit 1
    ;;
esac
