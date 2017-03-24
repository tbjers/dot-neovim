#!/usr/bin/env bash
#
# tbjers/dot-neovim ellipsis package

pkg.link() {
  fs.link_rfile "$PKG_PATH" "$HOME/.config/nvim"
}

pkg.install() {
  # install vim-plug
  mkdir -p "$PKG_PATH/autoload"
  curl -LSso "$PKG_PATH/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}
