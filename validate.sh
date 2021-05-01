#!/bin/bash
set -eu -o pipefail

echo "Fetching latest JSON Schema"
curl -s https://docs.renovatebot.com/renovate-schema.json > renovate-schema.json

# As of this writing, Renovate uses draft-04 which is
# too old for the validate command of ajv.
echo "Migrating schema to newer version"
npx ajv migrate -s renovate-schema.json

echo "Now validating.."

for x in $(ls -1 *.json | grep -v "^package.json$" | grep -v "^package-lock.json$"); do
  echo "Validating $x"
  npx ajv -s renovate-schema.json -d "$x" -c ajv-formats
done
