#!/bin/sh
set -eu

echo
echo ' *** Make sure to leave the challenge password empty! ***'
echo

mkdir -p incoming
openssl req -nodes -new -newkey rsa:2048 -keyout ca.key.pem -out incoming/ca.csr.pem
OPENSSL_CONF=ca.cnf openssl ca -selfsign -policy policy_ca -extensions ext_ca -in incoming/ca.csr.pem -out ca.crt.pem

git add ca.crt.pem ca.key.pem certs/01.pem index.txt serial.txt
echo '---'
echo
echo 'Your CA certificate and key have been generated and staged. Time to `git commit`!'
