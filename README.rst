This is a super simple template for an OpenSSL CA git repository!


To set it up::

  $ ./init.sh
  $ git commit

and fill in the DN fields for the CA's certificate. Then, to sign a CSR as a
server certificate::

  $ cp /path/to/some.csr.pem incoming
  $ ./sign.sh servers incoming/some.csr.pem
  $ git add .
  $ git commit

Signing a CSR as a client/e-mail certificate instead only requires one change::

  $ ./sign.sh clients incoming/some.csr.pem

The signing script can take whatever arguments |openssl ca|_ takes, so to force
a particular subject and issue a certificate for a particular number of days::

  $ ./sign.sh clients incoming/some.csr.pem -subj '/CN=example.com' -days 30


.. |openssl ca| replace:: ``openssl ca``
.. _openssl ca: http://www.openssl.org/docs/apps/ca.html
