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

The `Dockerfile` contains regular tests. The `docker-compose.yml` contains simple defaults so that adding tests and testing tests have a nicer workflow. That is,

1. Run `docker-compose --verbose up --build -d` to build (with cahces) and detach.
2. Run `docker exec -it <name> bash` where `<name>` is usually `<host-username>_dots_1` to explore the container's filesystem. `bash` can be replaced with `zsh`.
3. Run `docker-compose down` to stop the container.

And these steps can be quickly repeated for faster testing iterations.
