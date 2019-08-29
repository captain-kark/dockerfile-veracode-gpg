FROM vladgh/gpg
COPY veracode.pub /keys/
RUN /sbin/tini -- gpg --import /keys/veracode.pub
VOLUME /tmp/encrypt/  # file to encrypt
ENTRYPOINT ["gpg", "--encrypt", "--trust-model", "always", "-r", "mpt@veracode.com"]  # /tmp/encrypt/${filename}
