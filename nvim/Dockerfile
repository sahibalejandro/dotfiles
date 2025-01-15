FROM ubuntu:24.04

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get update
RUN apt-get -y install build-essential zsh zsh curl git unzip wget ripgrep fd-find

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
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -xzf nvim-linux64.tar.gz
RUN mv nvim-linux64 .local/share/neovim
RUN ln -s ~/.local/share/neovim/bin/nvim .local/bin/nvim

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Sahib's Dotfiles
#RUN git clone https://github.com/sahibalejandro/dotfiles.git
#RUN mkdir .config
#RUN ~/dotfiles/install-neovim

# LazyGit
#RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') \
#    && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
#    && tar xf lazygit.tar.gz lazygit \
#    && mv lazygit .local/bin/lazygit

# Use FNM to install Node LTS
RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
RUN ln -s ~/.local/share/fnm/fnm .local/bin/fnm
RUN echo "eval \"$(/home/zero/.local/bin/fnm env --use-on-cd --shell zsh)\"" >> .zshrc
RUN /home/zero/.local/bin/fnm install --lts

# Configure Git
#RUN git config --global user.name Sahib
#RUN git config --global user.email sjaramillo@etsy.com

RUN echo "export PATH=\"/home/zero/.local/bin:\$PATH\"" >> .zshrc
RUN sed -i "s/robbyrussell/cloud/" .zshrc

CMD ["/bin/zsh"]
