#!/bin/sh

set -euo pipefail

cd "$(dirname "$0")"

. ./common.sh || exit 1

if ! test -d "$content"; then
    warn "content directory '$content' missing, nothing to encrypt"
    exit 1
fi

test -f "$content.tar.gz" || > "$content.tar.gz"
chmod go-rwx "$content.tar.gz"

msg "encrypting directory: $content"
tar c "$content" | gzip -c | openssl des3 > "$content.tar.gz" && rm -fr "$content"

msg done
ls -l "$content.tar.gz"
