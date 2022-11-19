#!/bin/bash

declare -a my_files=( "README.md" "lab/workshop-codemash-2023.pdf" ".devcontainer" ".vscode/" "src/" "terraform/" )
WK_BRANCH="workshop-$(printf "%(%Y%m%d%H%M%S)T\n" $EPOCHSECONDS)"
git checkout -b ${WK_BRANCH}
for i in "${my_files[@]}"; do git checkout develop "$i"; done
echo "Now commit and push this branch to workshop"
