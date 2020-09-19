set -e

VENDOR=samsung
DEVICE=a30

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

RR_ROOT="$MY_DIR"/../../..

HELPER="$RR_ROOT"/vendor/RR/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$RR_ROOT"

# Copyright headers and guards
write_headers

# The standard blobs
write_makefiles "$MY_DIR"/proprietary-files.txt true
write_makefiles "$MY_DIR"/proprietary-files-system.txt true

# We are done!
write_footers
