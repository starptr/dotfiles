# dotfiles

This file is the readme for the dotfile repo. This text is here since this file will be in the home directory when cloned.

## Install

- Run `yadm clone https://github.com/starptr/dotfiles`.
- If `yadm` isn't available, try running

```console
$ curl -Lo ~/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm --create-dirs
$ chmod +x ~/bin/yadm
$ PATH=~/bin:$PATH
```

first.

## Development

Run `yadm submodule update --init` to pull the [polka-dots test suite](https://github.com/starptr/polka-dots). Usage instructions are on polka-dots's readme.

### Sidenote on Tests

Since the docker images built by the dockerfile is intended to simulate dotfiles deployment on a new machine, any testing method must not use external dependencies not already present on all supported systems. That is, we can't install `rustup`, `rustc`, `cargo` during the docker image build since the new built environment that the tests will be run on won't reflect actual used environments.

Therefore, we must build the tests on the host machine and run a script on the host machine that uses a series of `docker exec` and mounts test binaries to be ran inside the container so that we can reset the container between tests and the testing environment is preserved.
