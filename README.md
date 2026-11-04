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

## kitty, i3 and greenclip (desktop user)

Clipboard history needs `rofi-greenclip` from the AUR (`trizen -S rofi-greenclip`).

```sh
mkdir -p ~/.config/kitty ~/.config/i3
for f in kitty.conf current-theme.conf no-preference-theme.auto.conf; do
	ln -sf ~/dotfiles/kitty/$f ~/.config/kitty/$f
done
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/greenclip/greenclip.toml ~/.config/greenclip.toml
```

Ctrl+Insert copies, Shift+Insert pastes, and $mod+Insert opens the clipboard history.

The first time vim starts, it installs its plugins.
