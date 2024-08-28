FROM archlinux

WORKDIR /root

RUN pacman-key --init
RUN pacman -Syu --noconfirm

RUN pacman -Sy --noconfirm \
  base-devel \
  cargo \
  cmake \
  fontconfig \
  fzf \
  git \
  neovim \
  nodejs \
  npm \
  python \
  python-pip \
  tmux \
  vim

RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
RUN cargo binstall -y difftastic cargo-watch cargo-expand

# Install Rust analyzer
RUN mkdir -p ~/.local/bin
RUN curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
RUN chmod +x ~/.local/bin/rust-analyzer

RUN git clone https://github.com/dankirkham/.config
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN pacman -Sy --noconfirm \
  python-icecream \
  python-lsp-server \
  python-matplotlib \
  python-numpy \
  python-scipy

ENV PATH=/root/.cargo/bin:$PATH

CMD ["bash"]
