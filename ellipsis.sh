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
  case $(os.platform) in
    osx)
      brew install python3 neovim
      pip3 install --user neovim
      ;;
    linux)
      if utils.cmd_exists dnf; then
        sudo dnf install python3 neovim -y
      elif utils.cmd_exists apt-get; then
        sudo apt-get install -y python3 neovim
      elif utils.cmd_exists yum; then
        sudo yum install python3 neovim -y
      fi
      ;;
  esac
  cat <<\EOF
Please run :PlugInstall when you start `nvim`.
EOF
}
