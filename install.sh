#!/bin/bash

DOT_DIR="$HOME/dotfiles"

has() {
    type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
    if has "git"; then
        git clone https://github.com/kisqragi/dotfiles.git ${DOT_DIR}
    elif has "curl" || has "wget"; then
        TARBALL="https://github.com/kisqragi/dotfiles/archive/master.tar.gz"
        if has "curl"; then
            curl -L ${TARBALL} -o master.tar.gz
        else
            wget ${TARBALL}        
        fi
        tar -zxvf master.tar.gz
        rm -f master.tar.gz
        mv -f dotfiles-master "${DOT_DIR}"
    else
        echo "curl or wget or git required"
        exit 1
    fi

    if [ $(uname) == "Linux" ]; then
        DOT_DIR="$DOT_DIR/linux"
    elif [ $(uname) == "Darwin" ]; then
        DOT_DIR="$DOT_DIR/mac"
    else
        echo "Unknown OS"
        exit 1
    fi

    cd ${DOT_DIR}
    for f in *;
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".gitignore" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == "README.md" ]] && continue
        [[ "$f" == "install.sh" ]] && continue
        [[ "$f" == "yabai" ]] && continue

        ln -snf $DOT_DIR/"$f" $HOME/".$f"
        echo "Installed .$f"
    done

    if [ $(uname) == "Darwin" ]; then
        ln -s "${DOT_DIR}/yabai/skhdrc/ $HOME/.skhdrc"
        ln -s "${DOT_DIR}/yabai/yabairc/ $HOME/.yabairc"
        mkdir "$HOME/.config/yabai"
        cp "${DOT_DIR}/yabai/open_iterm2.sh" "$HOME/.config/yabai/open_iterm2.sh"
        chmod +x "$HOME/.config/yabai/open_iterm2.sh"
    fi
else
    echo "dotfiles already exists"
    exit 1
fi

