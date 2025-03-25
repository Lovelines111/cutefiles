
#!/bin/bash

# Base URL for the themes
BASE_URL="https://raw.githubusercontent.com/atelierbram/Base2Tone-kitty/main/themes"

# List of theme filenames
THEMES=(
  "base2tone-cave-dark"
  "base2tone-cave-light"
  "base2tone-desert-dark"
  "base2tone-desert-light"
  "base2tone-drawbridge-dark"
  "base2tone-drawbridge-light"
  "base2tone-earth-dark"
  "base2tone-earth-light"
  "base2tone-evening-dark"
  "base2tone-evening-light"
  "base2tone-field-dark"
  "base2tone-field-light"
  "base2tone-forest-dark"
  "base2tone-forest-light"
  "base2tone-garden-dark"
  "base2tone-garden-light"
  "base2tone-heath-dark"
  "base2tone-heath-light"
  "base2tone-lake-dark"
  "base2tone-lake-light"
  "base2tone-lavender-dark"
  "base2tone-lavender-light"
  "base2tone-mall-dark"
  "base2tone-mall-light"
  "base2tone-meadow-dark"
  "base2tone-meadow-light"
  "base2tone-morning-dark"
  "base2tone-morning-light"
  "base2tone-motel-dark"
  "base2tone-motel-light"
  "base2tone-pool-dark"
  "base2tone-pool-light"
  "base2tone-porch-dark"
  "base2tone-porch-light"
  "base2tone-sea-dark"
  "base2tone-sea-light"
  "base2tone-space-dark"
  "base2tone-space-light"
  "base2tone-suburb-dark"
  "base2tone-suburb-light"
)

# Loop through each theme and fetch the sha256
for THEME in "${THEMES[@]}"; do
  URL="${BASE_URL}/${THEME}.conf"
  HASH=$(nix-prefetch-url "$URL" --quiet)
  echo "${THEME} = \"${HASH}\";"
done
