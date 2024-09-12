cheat() {
  curl https://cheat.sh/$1
}

# IITH vpn
wgup() {
  wg-quick up wg0
}
wgdown() {
  wg-quick down wg0
}

# get myself to stop using vi, use vim or nvim instead
vi() {
  echo "NO"
  return 1
}

export EDITOR=nvim

vimrc() {
  "$EDITOR" ~/.vim/vimrc
}

nvimrc() {
  "$EDITOR" ~/.config/nvim/init.vim
}

zshrc() {
  "$EDITOR" ~/.zshrc
}

zshaliases() {
  $EDITOR ~/.dotfiles/zsh/custom/aliases.zsh
}

alias nview="nvim -R"
alias open="xdg-open"
alias codium="codium --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias cb="flatpak run app.getclipboard.Clipboard"
