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
export PATH=$PATH:~/.bin:~/.local/bin

# Add ruby binaries
export PATH=$PATH:~/.gem/ruby/2.6.0/bin

# Add yarn scripts
export PATH=$PATH:~/.yarn/bin

# Setup GOPATH
export GOPATH=$HOME/workspace/go

# Start X server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
