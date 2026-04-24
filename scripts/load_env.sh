#!/usr/bin/env bash
set -euo pipefail

env_file="${1:-.env}"

if [[ ! -f "$env_file" ]]; then
  echo "Brak pliku env: $env_file" >&2
  exit 1
fi

load_key() {
  local key="$1"
  local value

  value="$(grep -E "^${key}=" "$env_file" | tail -n 1 | cut -d= -f2- || true)"
  if [[ -n "$value" ]]; then
    export "$key=$value"
  fi
}

load_key GITHUB_BASE_URL
load_key GITHUB_OWNER
load_key GITHUB_REPO
load_key GITHUB_TOKEN
load_key FORGEJO_BASE_URL
load_key FORGEJO_OWNER
load_key FORGEJO_REPO
load_key FORGEJO_TOKEN
