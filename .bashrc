#!/usr/bin/env bash
#
# Best bashrc in history
#
# Author: Kyle Snyder
# License: MIT

# Source tools
. "$HOME/.asdf/asdf.sh"
eval "$(starship init bash)"

# Set environment
export GPG_TTY=$(tty)
export EDITOR='vim'
export READER='zathura'
export TERMINAL='alacritty'
export BROWSER='firefox'
export GREP_COLOR='1;36'
export HISTCONTROL='ignoredups'
export HISTSIZE=5000
export HISTFILESIZE=5000
export LSCOLORS='GxFxCxDxBxegedabagaced'
export PAGER='less'
export TZ='America/Los_Angeles'
export VISUAL='vim'
export FZF_DEFAULT_OPTS="--preview 'head -n 10 {}'"

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
export LESS_TERMCAP_ZW=$(tput rsupm)

# Path
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/zig-linux-x86_64-0.14.0-dev.1917+ecd5878b7

# Shell Options
shopt -s cdspell
shopt -s checkwinsize
shopt -s extglob
set -o vi

# Bindings
bind 'TAB:menu-complete'

# Bash Version >= 4
shopt -s autocd   2>/dev/null || true
shopt -s dirspell 2>/dev/null || true

# Aliases
alias e='vim'
alias ls="exa --icons"
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

eo() {
	vim $(fzf)	
}

# because `master` is sometimes `main` (or others), these must be functions.
gmb() { # git main branch
	local main
	main=$(git symbolic-ref --short refs/remotes/origin/HEAD)
	main=${main#origin/}
	[[ -n $main ]] || return 1
	echo "$main"
}

# show the diff from inside a branch to the main branch
gbd() { # git branch diff
	local mb=$(gmb) || return 1
	git diff "$mb..HEAD"
}

# checkout the main branch and update it
gcm() { # git checkout $main
	local mb=$(gmb) || return 1
	git checkout "$mb" && git pull
}

# merge the main branch into our branch
gmm() { # git merge $main
	local mb=$(gmb) || return 1
	git merge "$mb"
}

# print a colorized diff
colordiff() {
	local red=$(tput setaf 1 2>/dev/null)
	local green=$(tput setaf 2 2>/dev/null)
	local cyan=$(tput setaf 6 2>/dev/null)
	local reset=$(tput sgr0 2>/dev/null)

	diff -u "$@" | awk "
	/^\-/ {
		printf(\"%s\", \"$red\");
	}
	/^\+/ {
		printf(\"%s\", \"$green\");
	}
	/^@/ {
		printf(\"%s\", \"$cyan\");
	}

	{
		print \$0 \"$reset\";
	}"

	return "${PIPESTATUS[0]}"
}

# Print all supported colors with raw ansi escape codes
colors() {
	local i
	for i in {0..255}; do
		printf "\x1b[38;5;${i}mcolor %d\n" "$i"
	done
	tput sgr0
}

# Convert epoch to human readable
epoch() {
	local num=${1//[^0-9]/}
	(( ${#num} < 13 )) && num=${num}000
	node -pe "new Date(+process.argv[1]);" "$num"
}

# open the current path or file in GitHub
gho() {
	local file=$1
	local remote=${2:-origin}

	# get the git root dir, branch, and remote URL
	local gr=$(git rev-parse --show-toplevel)
	local branch=$(git rev-parse --abbrev-ref HEAD)
	local url=$(git config --get "remote.$remote.url")

	[[ -n $gr && -n $branch && -n $remote ]] || return 1

	# construct the path
	local path=${PWD/#$gr/}
	[[ -n $file ]] && path+=/$file

	# extract the username and repo name
	local a
	IFS=:/ read -a a <<< "$url"
	local len=${#a[@]}
	local user=${a[len-2]}
	local repo=${a[len-1]%.git}

	local url="https://github.com/$user/$repo/tree/$branch$path"
	echo "$url"
	open "$url"
}
# Load external files
. ~/.bash_aliases    2>/dev/null || true
. ~/.bashrc.local    2>/dev/null || true

# load completion
. /etc/bash/bash_completion 2>/dev/null ||
	. ~/.bash_completion 2>/dev/null

true
