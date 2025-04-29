# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
export SHELL="$(which zsh)"

# WSL stuff
zmodload zsh/zprof

# Enable FZF
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/bin/vendor_perl:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

#export PERL5LIB="/usr/local/telenor/vmware/vsphere-automation-sdk-perl/lib/sdk:/usr/local/telenor/vmware/vsphere-automation-sdk-perl/lib/runtime:/usr/local/telenor/vmware/vsphere-automation-sdk-perl/samples:$PERL5LIB"

###
### GLOBAL ZSH CONFIGURATION
###

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

tabs 4

# VCS prompt
# autoload -Uz vcs_info
# precmd() { vcs_info }
# setopt prompt_subst
# zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats       '%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# zstyle ':vcs_info:*' enable git
# vcs_info_wrapper() {
# 	vcs_info
# 	if [ -n "$vcs_info_msg_0_" ]; then
# 		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
# 	fi	
# }
# RPROMPT=$'$(vcs_info_wrapper)'

# Use ls color output
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=01;34:ow=01;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"


#zstyle ':completion:*:*:cd:*:directory-stack' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle ':completion:*' menu select=2
#zstyle ":completion:*:commands" rehash 1
#zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
#
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Allow approximate
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric

# History configuration
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history

# Auto stack directories
DIRSTACKSIZE=10
setopt autocd
setopt autopushd

# Expand expressions in braces
setopt BRACE_CCL

# Always expand $PWD to full path for symlinks
setopt chase_links

# Print current command in window title
# Print current path (if no command) in window title
precmd() {
	local prompt_host="${(%):-%M}"
	if [[ "${IS_ADMIN}" == "1" ]]; then
		local prompt_user="root"
	else
		local prompt_user="${(%):-%n}"
	fi
	local prompt_char="${(%):-%~}"
	if [[ ${#prompt_char} -gt 18 ]]; then
		prompt_char=..${prompt_char[${#prompt_char}-14, ${#prompt_char}]}
	fi
	printf '\e]0;%s [%s@%s]\a' "${prompt_char}" "${prompt_user}" "${prompt_host}"

	# Change the default window name in tmux
	printf "\033k%s %s@%s\033\\" "${prompt_char}" "${prompt_user}" "${prompt_host}"
}

###
### KEY BINDINGS
###

# Ensure emacs mode
bindkey -e

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del

# fix ctrl + right/left
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# fix ctrl + delete
bindkey '^[[3;5~' kill-word

# allow up and down keys to be used when searching (ctrl + r)
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

READNULLCMD=${PAGER:-/usr/bin/pager}

###
### GLOBAL EXPORTS
###

export BROWSER="firefox"

# Colors in less command
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Misc
export LANG=en_US.UTF-8
export LC_LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TIME=da_DK
export OOO_FORCE_DESKTOP="kde"
export EDITOR="vim"
export PAGER="less"

# Default options passed to less (search incase sensitive, don't count line numbers)
export LESS='-InSR'

export TERM='xterm-256color'
# Set TERM variable
 if [[ $TMUX == "" ]]; then
   if [ -e /usr/share/terminfo/x/xterm-256color ]; then
   	export TERM='xterm-256color'
   else
   	export TERM='xterm'
   fi
 fi


###
### ALIASES
###

alias ls='ls --quoting-style=literal -h --color'
alias ll='ls -lh'
alias la='ls -lAh'
alias f='ll | grep -i'
alias tmux='tmux -2'
alias grep='grep -E --color=auto'
alias -g gr='| grep -i'
alias -g pastebin="curl -F 'f:1=<-' ix.io"
alias dirs='dirs -lv'
alias du='du -h'
alias df='df -h'
alias slocate='slocate -i'
alias locate='locate -i'
alias ...='cd ../../'
alias makepkg='nice -n 19 makepkg'
alias nano='nano -xwc'
alias screen='screen -U'
alias poweroff='systemctl poweroff'
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias umount='sudo umount'
alias open='nohup xdg-open'
alias highlight="/usr/bin/vendor_perl/ack -i --color-match='bold red' --passthru"
alias jobs='jobs -l'
alias insecuressh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias insecurescp='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias gits='git status'
alias gitc='git commit'
alias os='openstack --insecure'
alias telenorvpn='sudo openconnect --servercert pin-sha256:/tB/6+LZjSZoGERkRCTCJeowG4sODjlkFuKsuMHGHIE= -u maals 212.242.37.232'

# Alias suffixes (kinda 'open with' functionality)
alias -s log="less"

###
### HANDY FUNCTIONS
###

# Shell colors
refresh_shell() {
	if [[ "${EUID}" == "0" || "${IS_ADMIN}" == "1" ]]; then
		export PS1="$(print '%{\e[1;31m%}%M%{\e[1;34m%} %c %{\e[1;34m%}%% %{\e[0m%}')" # Root color is red
	else
		export PS1="$(print '%{\e[1;32m%}%n@%M%{\e[1;33m%} %c %{\e[1;33m%}%% %{\e[0m%}')"
	fi
}

extract() {
	last_arg=$*[$#];
	if [ -d last_arg -o ! -f $last_arg -a $# -gt 1 ]; then
		dir=$last_arg;
		mkdir -p $dir;
	else
		dir=".";
	fi
	for archive in $*; do
		[ "$archive" = "$dir" ] && continue;
		if [ -f $archive ]; then
			case $archive in
				*.tar.bz2 | *.tbz2) tar -C $dir -xvjf $archive;;
				*.tar.gz | *.tgz)   tar -C $dir -xvzf $archive;;
				*.tar.xz | *.tgx)   tar -C $dir -xvJf $archive;;
				*.bz2)              bunzip2 -c $archive > $dir/`basename $archive .bz2`;;
				*.gz)               gunzip -c $archive > $dir/`basename $archive .gz`;;
				*.tar)              tar -C $dir -xvf $archive;;
				*.zip)              unzip -d $dir $archive;;
				*.jar)              unzip -d $dir $archive;;
				*.rar)              unrar x $archive $dir;;
				*.Z)                uncompress -c $archive > $dir/`basename $archive .Z`;;
				*.7z)               7z x -o$dir $archive;;
				*)
					# okay, the file extension is not recognized; try to detect the mime type
					echo "Invalid file extension. Trying to detect mime type..";
					mime=`file -b --mime-type $archive`
					case $mime in
						"application/x-bzip2")          tar -C $dir -jxvf $archive;;
						"application/x-gzip")           tar -C $dir -zxvf $archive;;
						"application/gzip")             tar -C $dir -zxvf $archive;;
						"application/x-xz")             tar -C $dir -xvJf $archive;;
						"application/zip")              unzip -d $dir $archive;;
						"application/x-rar")            unrar x $archive $dir;;
						"application/x-7z-compressed")  7z x -o$dir $archive;;
						"application/java-archive")     unzip -d $dir $archive;;
						*)
							echo "don't know how to extract '$archive'...";
							;;
					esac
					;;
			esac
		else
			echo "'$archive' is not a valid archive file!";
		fi
	done
}

function pack() {
	if [[ $# -lt 2 ]]; then
		echo "Compress files and directories via:"
		echo "  pack archive_file file [dir|file]*"
		return 1
	fi

	[[ -f $1 ]] && echo "error: destination $1 exists" && return 1

	local lower
	lower=${(L)1}
	case $lower in
		*.tar.bz2) tar --dereference -cvjf $@;;
		*.tar.gz) tar --dereference -cvzf $@;;
		*.tar.xz) tar --dereference -cvJf $@;;
		*.tar.lzma) tar --dereference --lzma -cvf $@;;
		*.bz2) 7za a -tbzip2 $@;;
		*.rar) rar a -r $@;;
		*.gz) 7za a -tgzip $@;;
		*.tar) tar --dereference -cvf $@;;
		*.tbz2) tar --dereference -cvjf $@;;
		*.tgz) tar --dereference -cvzf $@;;
		*.zip) zip -r $@;;
		*.7z) 7za a -t7z -mmt $@;;
		*) echo "I don't know what to do with '$1'";;
	esac
}

# Reload zsh config
reload() {
	[ -f /etc/zsh/zshrc ] && source /etc/zsh/zshrc
	[ -f ~/.zshrc ] && source ~/.zshrc
	return 0;
}

whois() {
	/usr/bin/whois -H $1 | iconv -f iso-8859-1 -t utf-8
}

# Make NFO files a "bit" prettier when reading with less
less() {
	case "${1}" in
		*.nfo|*.NFO)
			for f in "$@" ; do
				iconv -f cp437 -t "utf-8" < "$f" | =less
			done
			;;
		*)
			=less $@
			;;
	esac
}

# Make diff a bit colorful
diff() {
	if [[ -f /usr/bin/colordiff ]]; then
		/usr/bin/colordiff $@
	else
		/usr/bin/diff $@
	fi
}

# Ensure the shell prompt is set correctly
refresh_shell

makecsr() {
	KEYNAME=$1
	[ -s "$KEYNAME" ] || {
		echo "File '$KEYNAME' does not exist or is empty"
		return
	}
	DNS=$(echo $KEYNAME | sed s/'\.\w*$'//)
	openssl req -new -key $KEYNAME -subj "/C=DK/ST=Nordjylland/O=Telenor/CN=$DNS" -addext "subjectAltName = DNS:$DNS" -out $DNS.csr
	echo "Made CSR and wrote to '$DNS.csr'"
}
