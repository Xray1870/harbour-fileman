#!/bin/bash

SFDK=/home/rudi/SailfishOS/bin/sfdk
TARGETS=(
    # note: last field (/-.*?$/) has to be architecture
    "SailfishOS-3.3.0.16-armv7hl"
    "SailfishOS-3.3.0.16-i486"
)

showhelp() {
    echo "** build harbour-fileman-root **"
    echo "usage: build.sh [-h]"
    echo
    echo "modify this script to set the correct paths for your setup"
}

if [[ "$1" =~ ^-?-h(elp)?$ ]]; then
    showhelp
    exit 0
elif (( $# > 0 )); then
    echo "error: invalid arguments"
    showhelp
    exit 1
fi

if [[ ! -f "$SFDK" ]]; then
    echo "error: could not find sfdk at '$SFDK'"
    exit 2
fi

echo "starting build engine..."
"$SFDK" engine start

for t in "${TARGETS[@]}"; do
    "$SFDK" engine exec sb2 -t "$t" make BUILDARCH="${t##*-}"
done

echo "if you no longer need it, stop the build engine by running:"
echo "$SFDK engine stop"
exit 0
