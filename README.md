# dotfiles

## zsh (system-wide)

Installs the shared config to `/etc/zsh/` for all users. The named users each get a private `~/.zshrc` for their own settings.

```sh
sudo ~/dotfiles/zsh/install.sh root user1 user2
```

To start tmux automatically on login, add this line to that user's `~/.zshenv`:

```sh
ZSH_TMUX_AUTOSTART=1
```

## tmux and vim (per user)

```sh
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
```

The first time vim starts, it installs its plugins.
