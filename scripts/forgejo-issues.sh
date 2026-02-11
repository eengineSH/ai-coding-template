#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "help" || "${1:-}" == "-h" || "${1:-}" == "--help" || $# -eq 0 ]]; then
  cat <<'USAGE'
Uzycie:
  scripts/forgejo-issues.sh whoami
  scripts/forgejo-issues.sh issues-list [open|closed|all]
  scripts/forgejo-issues.sh issue-get <nr>
  scripts/forgejo-issues.sh issue-create <tytul> <opis>
  scripts/forgejo-issues.sh issue-comment <nr> <komentarz>
  scripts/forgejo-issues.sh issue-open <nr>
  scripts/forgejo-issues.sh issue-close <nr>

Wymagane zmienne srodowiskowe:
  FORGEJO_BASE_URL  np. https://git.iphoenix.pl
  FORGEJO_OWNER     np. Phoenix
  FORGEJO_REPO      np. TEST-Repo
  FORGEJO_TOKEN     token API Forgejo
USAGE
  exit 0
fi

for cmd in curl jq; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Brak wymaganego narzedzia: $cmd" >&2
    exit 1
  fi
done

: "${FORGEJO_BASE_URL:?Brak FORGEJO_BASE_URL}"
: "${FORGEJO_OWNER:?Brak FORGEJO_OWNER}"
: "${FORGEJO_REPO:?Brak FORGEJO_REPO}"
: "${FORGEJO_TOKEN:?Brak FORGEJO_TOKEN}"

BASE="${FORGEJO_BASE_URL%/}/api/v1"
REPO_PATH="/repos/${FORGEJO_OWNER}/${FORGEJO_REPO}"

api() {
  local method="$1"
  local path="$2"
  local body="${3:-}"

  if [[ -n "$body" ]]; then
    curl -fsS \
      -X "$method" \
      -H "Authorization: token ${FORGEJO_TOKEN}" \
      -H "Content-Type: application/json" \
      "${BASE}${path}" \
      -d "$body"
  else
    curl -fsS \
      -X "$method" \
      -H "Authorization: token ${FORGEJO_TOKEN}" \
      "${BASE}${path}"
  fi
}

command_name="$1"
shift || true

case "$command_name" in
  whoami)
    api GET "/user" | jq '{login, full_name, email}'
    ;;
  issues-list)
    state="${1:-open}"
    api GET "${REPO_PATH}/issues?state=${state}" | jq '[.[] | {number, title, state, updated_at}]'
    ;;
  issue-get)
    number="${1:?Podaj numer issue}"
    api GET "${REPO_PATH}/issues/${number}" | jq '{number, title, body, state, user: .user.login, assignees: [.assignees[].login], labels: [.labels[].name], updated_at}'
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
    echo "Uruchom: scripts/forgejo-issues.sh --help" >&2
    exit 1
    ;;
esac
