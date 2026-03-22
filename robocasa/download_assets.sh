#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A ASSETS=(
    ["models/assets/objects/lightwheel/objects_lightwheel.zip"]="https://utexas.box.com/shared/static/vckqvvkh1z8t69k8qcpcmee6k66stii4.zip"
    ["models/assets/fixtures/fixtures_lightwheel.zip"]="https://utexas.box.com/shared/static/idbncsadpnaz1jfl4i6m8qejawk7p9pi.zip"
    ["models/assets/textures/textures.zip"]="https://utexas.box.com/shared/static/4i85ileasdvstmlln5sbvzptz7keuoy1.zip"
    ["models/assets/generative_textures/generative_textures.zip"]="https://utexas.box.com/shared/static/ebaad09k82tmfmlq6ohdkmrh8izl9vn5.zip"
    ["models/assets/objects/objaverse/objaverse.zip"]="https://utexas.box.com/shared/static/03eionyo8fk3a9dsksq9jb8du5lqfw8h.zip"
    ["models/assets/objects/aigen_objs/aigen_objs.zip"]="https://utexas.box.com/shared/static/nwi1vrn5pgbo95kushkasa3nx1i012ff.zip"
    ["models/assets/fixtures/fixtures.zip"]="https://utexas.box.com/shared/static/zt9vbo38yb9f1alw9iuahck55hoa65y6.zip"
)

for DEST_REL in "${!ASSETS[@]}"; do
    URL="${ASSETS[$DEST_REL]}"
    DEST="$SCRIPT_DIR/$DEST_REL"
    DIR="$(dirname "$DEST")"

    mkdir -p "$DIR"
    echo "Downloading $(basename "$DEST") -> $DIR"
    curl -L --fail --progress-bar -o "$DEST" "$URL"
    echo "Extracting..."
    unzip -q -o "$DEST" -d "$DIR"
    rm "$DEST"
done

echo "Done."
