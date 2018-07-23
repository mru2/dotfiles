# Enable prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" 
fi

# Enable Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Default editor
export VISUAL=vim
export EDITOR=vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add custom bin
export PATH=$PATH:~/.bin

# Add ruby binaries
export PATH=$PATH:/home/mru2/.gem/ruby/2.5.0/bin

# Start X server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
