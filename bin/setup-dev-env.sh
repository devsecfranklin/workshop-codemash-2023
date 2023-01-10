#!/bin/bash 

# workshop-codemash-2023 setup script

# v0.1 11/18/2022 first version

# Author:  devsecfranklin@duck.com 

#set -eu

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

RED='\033[0;31m'
LRED='\033[1;31m'
LGREEN='\033[1;32m'
LBLUE='\033[1;34m'
CYAN='\033[0;36m'
LPURP='\033[1;35m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

CONTAINER=false
APT_COMMAND="sudo apt-get"
declare -a PACKAGES=()

# Check if we are inside a docker container
function check_docker() {
  if [ -f /.dockerenv ]; then
    echo -e "${LGREEN}Building in container...${NC}"
    CONTAINER=true
    APT_COMMAND="apt-get"
  fi
}

function check_installed() {
  if ! command -v ${1} &> /dev/null
  then
    echo -e "${RED}${1} could not be found${NC}"
    return 1 # false
  else
    echo -e "${LGREEN}Found ${1} installed.${NC}"
    return 0 # true
  fi
}

function install_debian() {
  echo -e "${LBLUE}Installing packages.${NC}"
  # Container package installs will fail unless you do an initial update, the upgrade is optional
  if [ "${CONTAINER}" = true ]; then
    sudo ${APT_COMMAND} update && sudo ${APT_COMMAND} upgrade -y
  fi

  for i in ${Packages[@]};
  do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ${i}|grep "install ok installed") &> /dev/null
    # echo -e "${LBLUE}Checking for ${i}: ${PKG_OK}${NC}"
    if [ "" = "${PKG_OK}" ]; then
      echo -e "${LBLUE}Installing ${i} since it is not found.${NC}"
       sudo ${APT_COMMAND} --yes install ${i}
    fi
  done
}

function setup_gcloud() {
  echo -e "${LBLUE}Setting up gcloud.${NC}"

  if [ -f "/etc/apt/sources.list.d/google-cloud-sdk.list" ]; then rm /etc/apt/sources.list.d/google-cloud-sdk.list; fi

  sudo ${APT_COMMAND} install -y apt-transport-https ca-certificates gnupg
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  sudo ${APT_COMMAND} update && sudo ${APT_COMMAND} -y install google-cloud-cli
  echo -e "${LBLUE}Google Cloud setup complete.${NC}"
}

# Latest Terraform is 1.3.7
function setup_terraform() {
  echo -e "${LBLUE}Setting up Terraform.${NC}"
  curl -LO https://raw.github.com/robertpeteuil/terraform-installer/master/terraform-install.sh
  chmod +x terraform-install.sh
  bash terraform-install.sh 1.3.5
  echo -e "${LBLUE}Terraform setup complete.${NC}"
}

function main() {
  check_docker

  PACKAGES+=( "curl" "vim-tiny" "unzip" ./set)
  # only install this extra stuff if ther `.franklin` file exists
  if [ -f ".franklin" ]; then
    echo -e "${GREEN}Installing LaTeX packages to build documentation.${NC}"
    declare -a  PACKAGES+=( "doxygen" "gawk" "doxygen-latex" "automake" "latex-beamer" "dvipng" "latexmk" )
  fi

  install_debian # now install all the packages listed in the array
  setup_gcloud
  check_installed terraform || setup_terraform
}

main