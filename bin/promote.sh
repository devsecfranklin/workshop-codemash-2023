#!/bin/bash

declare -a my_files =[ "workshop-codemash-2023.pdf" ".vscode/" "src/" "terraform/" ]

git checkout workshop
for i in "${my_files[@]}"; do git checkout workshop "$i"; done
git checkout develop tempfile

git statu
