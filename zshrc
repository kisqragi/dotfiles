# prompt
PROMPT='%F{green}%n%f:%F{blue}%~%f # '
#RPROMPT='%F{blue}[%d]%f'
RPROMPT=''

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# option
# コマンドの入力ミスを修正してくれる
setopt correct

# 重複コマンドは古いものを削除
setopt HIST_IGNORE_ALL_DUPS

# 直前と同じコマンドは追加しない
setopt HIST_IGNORE_DUPS

# コマンド履歴の共有
setopt share_history

# ビープ音無効
setopt no_beep

# 補完時大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# complementation 
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# alias configuration
alias h="history"
alias c="cd .."
alias cp="cp -ri"
alias ls='ls -FG'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -ri'
alias mv='mv -i'
alias kali='docker run -it --rm my-kali'

