#!/bin/bash

# Check for jq
if ! command -v jq &> /dev/null; then
    echo "❌ jq is required but not installed."
    exit 1
fi

# Loop over all key-value pairs in the JSON object
jq -r 'to_entries[] | "\(.key)=\(.value | @sh)"' "$CONFIG_FILE" | while read -r line; do
    eval "export $line"
done

echo "✅ All config values have been dynamically exported as environment variables."
