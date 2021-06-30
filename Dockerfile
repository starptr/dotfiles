FROM ubuntu:20.04
RUN apt update && apt install -y sudo
RUN useradd -m hamu && echo "hamu:hamu" | chpasswd && adduser hamu sudo
WORKDIR /home/hamu
RUN apt install -y curl git
USER hamu
RUN curl -Lo ~/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm --create-dirs
RUN chmod +x ~/bin/yadm
COPY --chown=hamu:hamu ./.config/yadm/repo.git /home/hamu/src/dotfiles
RUN ~/bin/yadm clone --no-local file:///$HOME/src/dotfiles
