#!/bin/sh
set -eu
export OPENSSL_CONF=ca.cnf
cert_type="$1"
csr="$2"
shift 2
openssl ca -extensions "ext_${cert_type}" -in "${csr}" "$@"
