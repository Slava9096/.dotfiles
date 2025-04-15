# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#History 
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/history

#Auto complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdotd)

#Aliases
alias copy='xclip -selection clipboard'
alias xampp='sudo sh -c "/opt/lampp/manager-linux-x64.run &"'
alias laptopServer='ssh slava9096@192.168.0.12 -p 34200'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias open="xdg-open"

bindkey "^[[3~" delete-char

#Exports
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=$PATH:~/.spoof-dpi/bin
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export EDITOR=nvim
export VISUAL=nvim
export SYSTEMD_EDITOR=nvim

eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
