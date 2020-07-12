# prompt
PROMPT='%F{green}%n%f:%F{blue}%~%f # '
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
alias history="history -1000"
alias h="history"
alias c="cd .."
alias cp="cp -ri"
alias ls='ls -FG --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -ri'
alias mv='mv -i'
alias g++='/usr/local/bin/g++-9'
alias gcc='/usr/local/bin/gcc-9'
alias compilerbook='docker run --rm -it -v $HOME/work/kcc:/kcc -v $HOME/work/chibicc:/chibicc -v $HOME/work/course2020:/course2020 compilerbook'
alias lowlevel='docker run --rm -it -v $HOME/Desktop/study2020:/lowlevel lowlevel'

# PATH
export PATH="/usr/local/opt/binutils/bin:$PATH"

# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
    tmux
fi

