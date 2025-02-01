FROM ubuntu:24.04

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get update
RUN apt-get -y install build-essential zsh zsh curl git unzip wget ripgrep fd-find fzf

# Properly create the user that matches the host user.
# Apparently this does not have any effect on MacOS hosts.
RUN userdel -f ubuntu
RUN groupadd -g ${GROUP_ID} reploids
RUN useradd -l -u ${USER_ID} -g reploids zero
RUN mkdir -p /home/zero
RUN chown zero:reploids /home/zero

USER zero:reploids
WORKDIR /home/zero

RUN mkdir -p .local/bin
RUN mkdir -p .local/share
RUN mkdir -p .local/share/nvim

# NeoVim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN tar -xzf nvim-linux-x86_64.tar.gz
RUN mv nvim-linux-x86_64 .local/share/neovim
RUN ln -s ~/.local/share/neovim/bin/nvim .local/bin/nvim

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Use FNM to install Node LTS
RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
RUN ln -s ~/.local/share/fnm/fnm .local/bin/fnm
RUN echo "eval \"$(/home/zero/.local/bin/fnm env --use-on-cd --shell zsh)\"" >> .zshrc
RUN /home/zero/.local/bin/fnm install --lts

RUN echo "export PATH=\"/home/zero/.local/bin:\$PATH\"" >> .zshrc
RUN sed -i "s/robbyrussell/cloud/" .zshrc

CMD ["/bin/zsh"]
