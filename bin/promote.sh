#!/bin/bash

# Author : devsecfranklin@duck.com

function promote_files() {
declare -a my_files=( "README.md" "lab/workshop-codemash-2023.pdf" ".devcontainer" ".vscode/" "src/" "terraform/" )
git checkout workshop # We have to start from here
WK_BRANCH="workshop-$(printf "%(%Y%m%d%H%M%S)T\n" $EPOCHSECONDS)" # make a temp name for workshop branch
git checkout -b ${WK_BRANCH} # checkout out the new branch name
for i in "${my_files[@]}"; do git checkout develop "$i"; done
echo "Now commit and push this branch to workshop"
}


#function remove_file() {
#  
#}

function main()  {
  promote_files
}

main
