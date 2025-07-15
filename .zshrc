export PATH=$HOME:~/.config/rofi/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fino-time"
plugin=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
globalias() {
	if [[ $LBUFFER =~ '[a-zA-Z0-9]+$' ]]; then
		zle _expand_alias
		zle _expand-word
	fi
	zle self-insert
}
zle -N globalias
bindkey " " globalias
bindkey "^[[Z" magic-space
bindkey -M isearch " " magic-space
. ~/.zsh_aliases
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="⚡"
export SPACESHIP_BATTERY_SHOW=false
