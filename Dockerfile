FROM ubuntu:20.04
RUN apt-get update && apt-get install -y sudo
RUN useradd -m hamu && echo "hamu:hamu" | chpasswd && adduser hamu sudo
WORKDIR /home/hamu
RUN apt-get install -y curl git
USER hamu
ARG DOTS_REPO_GIT_RELATIVE
COPY --chown=hamu:hamu ${DOTS_REPO_GIT_RELATIVE:-./.local/share/yadm/repo.git} /home/hamu/src/dotfiles
RUN ls -al /home/hamu
RUN ls -al /home/hamu/src
RUN curl -Lo ~/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm --create-dirs \
	&& chmod +x ~/bin/yadm \
	&& ~/bin/yadm clone --no-local --no-bootstrap file:///$HOME/src/dotfiles \
	&& rm -rf ~/src/dotfiles \
	&& { ystatus=$(~/bin/yadm status --porcelain); \
		if [ -n "$ystatus" ]; then \
			echo "Warning: there were file conflicts when cloning the dotfiles. This will overwrite existing files with dotfiles." \
			&& echo "$ystatus" \
			&& ~/bin/yadm restore .; \
		else \
			echo "No cloning conflicts found."; \
		fi }
