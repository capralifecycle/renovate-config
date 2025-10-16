#!/usr/bin/env bash
set -euo pipefail

SCHEMA="renovate-schema.json"

echo "Fetching latest JSON Schema"
curl -s "https://docs.renovatebot.com/$SCHEMA" > "$SCHEMA"

# As of this writing, Renovate uses draft-04 which is
# too old for the validate command of ajv.
echo "Migrating schema [${SCHEMA}] to newer version"
npx ajv migrate -s "$SCHEMA"

echo "Now validating.."

for x in *.json; do
  if [[ "$x" != "package.json" && "$x" != "package-lock.json" ]]; then
    echo "Validating $x .."
    npx ajv -s "$SCHEMA" -d "$x" -c ajv-formats --strict-schema=false
  fi
done
