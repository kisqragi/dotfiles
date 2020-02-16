#!/bin/bash

DOT_DIR="$HOME/dotfiles"

has() {
    type "$1" > /dev/null 2>&1
}

if !(has "git"); then
    echo "command not found: git"
else
    if [ ! -d ${DOT_DIR} ]; then
        git clone https://github.com/kisqragi/dotfiles.git ${DOT_DIR}
        cd ${DOT_DIR}
        for f in *
        do
            [[ "$f" == ".git" ]] && continue
            [[ "$f" == ".gitignore" ]] && continue
            [[ "$f" == ".DS_Store" ]] && continue
            [[ "$f" == "README.md" ]] && continue
            [[ "$f" == "install.sh" ]] && continue

            ln -snf $DOT_DIR/"$f" $HOME/".$f"
            echo "Installed .$f"
        done
    else
        cd ${DOT_DIR}
        git pull
    fi
fi
