#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

required=(
  "CLAUDE.md"
  ".claude/settings.json"
  ".claude/agents/orchestrator.md"
  ".claude/agents/product-manager.md"
  ".claude/agents/architect.md"
  ".claude/agents/backend-engineer.md"
  ".claude/agents/frontend-engineer.md"
  ".claude/agents/qa-engineer.md"
  ".claude/agents/security-engineer.md"
  ".claude/agents/code-reviewer.md"
  "docs/SECURITY.md"
  "policies/permissions.md"
)

for path in "${required[@]}"; do
  if [[ ! -f "$path" ]]; then
    echo "MISSING: $path" >&2
    exit 1
  fi
done

agent_count="$(find .claude/agents -maxdepth 1 -type f -name '*.md' | wc -l)"
if [[ "$agent_count" -ne 8 ]]; then
  echo "Expected 8 agent definitions, found $agent_count" >&2
  exit 1
fi

while IFS= read -r file; do
  if ! head -n 1 "$file" | grep -q '^---$'; then
    echo "Missing YAML frontmatter opening delimiter: $file" >&2
    exit 1
  fi
  if ! grep -q '^name:' "$file"; then
    echo "Missing agent name: $file" >&2
    exit 1
  fi
done < <(find .claude/agents -maxdepth 1 -type f -name '*.md' | sort)

python3 - <<'PY'
import json
with open(".claude/settings.json", encoding="utf-8") as f:
    json.load(f)
print("Claude settings JSON: valid")
PY

echo "Framework structure: OK"
echo "Agent definitions: $agent_count"
echo "Note: This check does not validate compatibility with your installed Claude Code version."
