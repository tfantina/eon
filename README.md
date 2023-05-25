# Eon 🗝

Eon is a tool for encrypting and decrypting short text files on the fly. It's primary goal is to provide a secure way to encrypt `.env` files so that they can be checked into version control. 

## Installation

Eventually I'd like to publish Eon as a Homebrew formula so that it can be quickly installed and used without hassle. However for the time being you need to add the `/bin/eon` to your 
`$PATH`.  This can be done by editing your `.zshrc` or `.bashrc` with this line: `export PATH="~/eon/lib/eon:$PATH"` (of course the path needs to be relative to wherever you have the Eon folder).


## Usage

At the moment Eon has three commands:

`eon.rb generate` which creates a new `eon_aes.key` this is a secret aes key used for encrypting and decrypting files. Keep this key with your project but **DO NOT** check it into version control.
`.gitignore` `eon_aes.key`! For any developers working on the project who need access to encrypted .env files give them a copy of this file using a secure service such as Keybase.

`eon.rb encrypt file destination` `encrypt` takes two argements the first is an unencrypted file `.env` for example, and the second is a destination where a new encrypted file will be created: `.env.encrypted`

`eon.rb decrypt file destination` `decrypt` takes two arguments, the first is an encrypted file `.env.encrypted` for examople, and the second is a destination where the decrypted file will live: `.env`

## Development

I'm still working on this, I haven't quite figured out how to create Homebrew formula, I'm open to PRs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tfantina/eon.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
