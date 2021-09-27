
## Installing chezmoi

The dotfiles in this repository are managed with
[chezmoi](https://github.com/twpayne/chezmoi). Install chezmoi with:

```
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- -b ~/.local/bin init --apply <github-username>

```

## Initial setup

```
$ apt install zsh tmux
$ chsh -s $(which zsh)
$ curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
$ antibody bundle < ~/.local/share/chezmoi/zsh_plugins.txt > ~/.zsh_plugins.sh
```

## Initial vim setup

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim

:PluginInstall
```

## Initial tmux setup

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux new

<prefix>-I
```

