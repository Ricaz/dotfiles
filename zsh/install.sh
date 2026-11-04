#!/usr/bin/env bash
# Install the shared zsh config to /etc/zsh and give each user a private ~/.zshrc.
#
#   sudo ./install.sh                    # shared files only
#   sudo ./install.sh root user1 user2   # also set up these users' ~/.zshrc
#
# A user's existing ~/.zshrc is kept if it's already a zshrc.local stub.
# Anything else (old full config, symlink into dotfiles) is moved to
# ~/.zshrc.bak-<timestamp>, so you can copy private bits into the new stub.
set -euo pipefail

src=$(cd "$(dirname "$0")" && pwd)
ts=$(date +%Y%m%d-%H%M%S)

if (( EUID != 0 )); then
	echo "Run with sudo." >&2
	exit 1
fi

for f in zshrc p10k.zsh; do
	if [[ -e /etc/zsh/$f && ! -e /etc/zsh/$f.orig ]]; then
		cp -a "/etc/zsh/$f" "/etc/zsh/$f.orig"
		echo "Saved old /etc/zsh/$f as /etc/zsh/$f.orig"
	fi
	install -D -o root -g root -m 644 "$src/$f" "/etc/zsh/$f"
	echo "Installed /etc/zsh/$f"
done

for user in "$@"; do
	if ! entry=$(getent passwd "$user"); then
		echo "No such user: $user" >&2
		continue
	fi
	home=$(cut -d: -f6 <<<"$entry")
	group=$(id -gn "$user")
	rc=$home/.zshrc

	if [[ -f $rc && ! -L $rc ]] && head -n1 "$rc" | grep -q '^# zshrc.local'; then
		echo "$rc: already a local stub, left alone"
		continue
	fi
	if [[ -e $rc || -L $rc ]]; then
		mv -- "$rc" "$rc.bak-$ts"
		chmod 600 "$rc.bak-$ts" 2>/dev/null || true
		echo "$rc: moved old file to $rc.bak-$ts (copy anything private from it)"
	fi
	install -o "$user" -g "$group" -m 600 "$src/zshrc.local.example" "$rc"
	echo "$rc: created local stub"
done
