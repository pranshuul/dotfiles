# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey -v
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pranshuul/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias hx='helix'
alias n='nvim'
alias z='echo "Use \"cd\" instead"'
alias yz='yazi'
alias config='cd ~/dotfiles/'
alias ls='eza --icons=always'
alias tree='ls --tree'
alias s='locate'
alias wh='which'
alias bye='shutdown now'

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export HYPRSHOT_DIR=~/Pictures/Screenshots
export XDG_PICTURES_DIR=~/Pictures/Screenshots


(cat ~/.config/wpg/sequences &)

eval "$(starship init zsh)"
eval "$(thefuck --alias tf)"
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh//plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh//plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
