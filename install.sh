#!/bin/bash

DOT_DIR="$HOME/dotfiles"

for f in ??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == "README.md" ]] && continue

    ln -sf $DOT_DIR/"$f" $HOME/".$f"
    echo "Installed .$f"
done
