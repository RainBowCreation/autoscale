#!/bin/bash
: "${CONFIG_FILE:=config.json}"

if ! command -v jq &> /dev/null; then
  echo "❌ jq is required but not installed." >&2
  return 1 2>/dev/null || exit 1
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Executed: print export lines for eval
  jq -r 'to_entries[] | "export \(.key)=\(.value|@sh)"' "$CONFIG_FILE"
else
  # Sourced: export directly into current shell
  while IFS= read -r line; do eval "export $line"; done < <(
    jq -r 'to_entries[] | "\(.key)=\(.value|@sh)"' "$CONFIG_FILE"
  )
  echo "✅ All config values have been exported into this shell."
fi
