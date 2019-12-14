#!/bin/bash
set -eu -o pipefail

echo "Fetching latest JSON Schema"
curl -s https://raw.githubusercontent.com/renovatebot/renovate/master/renovate-schema.json > renovate-schema.json

echo "Now validating.."
echo "Note: The logs for 'keywords ignored' can be ignored."

for x in $(ls -1 *.json | grep -v "^package.json$" | grep -v "^package-lock.json$"); do
  echo "Validating $x"
  npx ajv -s renovate-schema.json -d "$x"
done
