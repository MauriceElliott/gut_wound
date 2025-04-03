#!/bin/sh

# Define the pattern to match the lines to be removed
PATTERN='^\+--\[\[pod_format="raw",created="[0-9 :-]*",modified="[0-9 :-]*",revision=[0-9]*\]\]$'

# Find all files in the repository that contain the pattern and remove the matching lines
grep -rlE "$PATTERN" . | while read -r file; do
  sed -i "/$PATTERN/d" "$file"
  echo "Removed matching lines from $file"
done

echo "Done."
