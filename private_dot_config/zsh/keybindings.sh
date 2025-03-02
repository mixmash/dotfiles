# Source: https://github.com/Parth/dotfiles/blob/master/zsh/keybindings.sh
# Ctrl-H 	Goes to the root of a git project, runs `cd $(git rev-parse --show-toplevel
# Ctrl-K 	Runs cd ..
# Ctrl-G 	Runs git add -A; git commit -v && git push
# Ctrl-V 	Runs fc. Takes last command and puts it in a vim buffer.
# Ctrl-S 	Adds sudo to the beginning of the buffer.
# Ctrl-L 	Runs ls.
# Ctrl-O 	Equivalent to hitting Enter.
# Ctrl-P 	Equivalent to pressing Up Arrow.
# up
function up_widget() {
	BUFFER="cd .."
	zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# Enter
function enter_line() {
	zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Home - Navigates to the current root workspace
function git_root() {
	BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
	zle accept-line
}
zle -N git_root
bindkey "^h" git_root
