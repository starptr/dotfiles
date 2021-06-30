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

The `Dockerfile` contains regular tests. The `docker-compose.yml` contains simple defaults so that adding and testing tests have a nicer workflow. That is,

1. Run `docker-compose --verbose up --build -d` to build (with cahces) and detach.
2. Run `docker exec -it <name> bash` where `<name>` is usually `<host-username>_dots_1` to explore the container's filesystem. `bash` can be replaced with `zsh`.
3. Run `docker-compose down` to stop the container.

And these steps can be quickly repeated for faster testing iterations.

### Tests

Since the docker images built by the dockerfile is intended to simulate dotfiles deployment on a new machine, any testing method must not use external dependencies not already present on all supported systems. That is, we can't install `rustup`, `rustc`, `cargo` during the docker image build since the new built environment that the tests will be run on won't reflect actual used environments.

Therefore, we must build the tests on the host machine and run a script on the host machine that uses a series of `docker exec` and mounts test binaries to be ran inside the container so that we can reset the container between tests and the testing environment is preserved.
