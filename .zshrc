#!/usr/bin/env zsh
#
# Best zshrc in history
#
# Author: Kyle Snyder
# License: MIT

# Source tools
. "$HOME/.asdf/asdf.sh"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Set environment
export GPG_TTY=$(tty)
export EDITOR='hx'
export READER='zathura'
export TERMINAL='alacritty'
export BROWSER='zen'
export GREP_COLOR='1;36'
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.zsh_history
export LSCOLORS='GxFxCxDxBxegedabagaced'
export PAGER='less'
export TZ='America/Los_Angeles'
export VISUAL='hx'

# Support colors in less
export LESS_TERMCAP_mb=$(tput bold; tput setaf 0) # Black
export LESS_TERMCAP_md=$(tput bold; tput setaf 0) # Black
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 3) # Black text on yellow background
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2) # Bold green underline
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

# Path
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/zig:$HOME/.npm-global/bin

# ZSH Options
setopt autocd
setopt extendedglob
setopt correct
setopt SHARE_HISTORY
bindkey -v

# Aliases
alias e='nvim'
alias ls="exa"
alias void="/usr/bin/git --git-dir=$HOME/.void/ --work-tree=$HOME $arv"
alias repo="cd ~/git"
alias mln="cd ~/git/ml-nerves"
alias b="cd ~/docs/books"

# Git Aliases
alias nb='git checkout -b "$USER-$(date +%s)"' # new branch
alias ga='git add . --all'
alias gb='git branch'
alias gc='git clone'
alias gci='git commit -a'
alias gco='git checkout'
alias gd="git diff ':!*lock'"
alias gdf='git diff' # git diff (full)
alias gi='git init'
alias gl='git log'
alias gp='git push origin HEAD'
alias gr='git rev-parse --show-toplevel' # git root
alias gs='git status'
alias gt='git tag'
alias gu='git pull' # gu = git update

# Functions
gmb() {
	local main
	main=$(git symbolic-ref --short refs/remotes/origin/HEAD)
	main=${main#origin/}
	[[ -n $main ]] || return 1
	echo "$main"
}

gbd() { # git branch diff
	local mb=$(gmb) || return 1
	git diff "$mb..HEAD"
}

gcm() { # git checkout $main
	local mb=$(gmb) || return 1
	git checkout "$mb" && git pull
}

gmm() { # git merge $main
	local mb=$(gmb) || return 1
	git merge "$mb"
}

colordiff() {
	local red=$(tput setaf 1 2>/dev/null)
	local green=$(tput setaf 2 2>/dev/null)
	local cyan=$(tput setaf 6 2>/dev/null)
	local reset=$(tput sgr0 2>/dev/null)

	diff -u "$@" | awk "
	/^\-/ { printf(\"%s\", \"$red\"); }
	/^\+/ { printf(\"%s\", \"$green\"); }
	/^@/ { printf(\"%s\", \"$cyan\"); }
	{ print \$0 \"$reset\"; }"

	return $pipestatus[1]
}

colors() {
	for i in {0..255}; do
		print -P "%F{$i}color $i"
	done
	tput sgr0
}

epoch() {
	local num=${1//[^0-9]/}
	(( ${#num} < 13 )) && num=${num}000
	node -pe "new Date(+process.argv[1]);" "$num"
}

gho() {
	local file=$1
	local remote=${2:-origin}

	local gr=$(git rev-parse --show-toplevel)
	local branch=$(git rev-parse --abbrev-ref HEAD)
	local url=$(git config --get "remote.$remote.url")

	[[ -n $gr && -n $branch && -n $remote ]] || return 1

	local path=${PWD/#$gr/}
	[[ -n $file ]] && path+=/$file

	local user_repo=(${(s[:/:])${url%.git}})
	local user=${user_repo[-2]}
	local repo=${user_repo[-1]}
	local gh_url="https://github.com/$user/$repo/tree/$branch$path"

	echo "$gh_url"
	open "$gh_url"
}

# Load external files
[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# Completion
autoload -Uz compinit && compinit

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fzf-tab/fzf-tab.zsh
