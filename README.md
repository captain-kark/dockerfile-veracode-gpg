The document to encrypt should be mounted into the `/tmp/encrypt` directory of the container. The resulting `.gpg` file to share with veracode will appear next to it once the container terminates.

```
docker run --rm -it -v "${PWD}/encrypt/:/tmp/encrypt/" captainkark/veracode-gpg /tmp/encrypt/foobar.txt
```

Afterwards, on the host machine:

```
$: ls -A1 encrypt/
test.txt
test.txt.gpg
```

You can attach `test.txt.gpg` to an email (or whatever) to communicate secrets with veracode.

The public key that comes baked into the image can be verified, if desired.

```
$: docker run --rm -it --entrypoint gpg captainkark/veracode-gpg --list-keys
```

Which should output the following:

```
/root/.gnupg/pubring.kbx
------------------------
pub   rsa2048 2012-04-24 [SC]
      58F651DCBE9A644A8C01A485A56B91234E651127
uid           [ unknown] Veracode MPT Team ⟨mpt@veracode.com⟩
sub   rsa2048 2012-04-24 [E]
```
