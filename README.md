encrypt-dir-openssl
===================

A low-tech solution to encrypt a directory.

Requirements
------------

- Bash: to run scripts to decrypt and encrypt content
- `openssl`: to encrypt the contents of a directory

Usage
-----

First time:

1. Create a directory named `content`
2. Add some content inside the `content` directory
3. Run `./encrypt.sh` to encrypt the `content` directory and save to a file `content.tar.gz` and delete the `content` directory

Choose your password wisely.
You will have to re-enter this password every time you mount the encrypted directory.
If you lose this password, it's impossible to recover the content.

View and modify the encrypted content later:

1. Run `./decrypt.sh` and enter your password you used to create the encrypted content.
2. View or modify files inside the `content` directory.
3. When done editing files, run `./encrypt.sh` and enter a new password.

How it works
------------

Encrypted content is stored in the `content.tar.gz` file.
After you run `./decrypt.sh`, the `content` directory is recreated.
In this state your content is visible,
which also implies that's vulnerable, until you run `./encrypt.sh` again.
