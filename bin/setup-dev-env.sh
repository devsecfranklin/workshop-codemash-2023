#!/bin/bash 

# workshop-codemash-2023 setup script

CONTAINER=false

# Check if we are inside a docker container
function check_docker() {
  if [ -f /.dockerenv ]; then
    echo -e "${LGREEN}Building in container...${NC}"
    CONTAINER=true
  fi
}

function check_installed() {
  if ! command -v ${1} &> /dev/null
  then
    echo "${1} could not be found"
    exit
  fi
}

function install_debian() {
  #declare -a  Packages=( "doxygen" "gawk" "doxygen-latex" "automake" )
  declare -a Packages=( "curl" "vim-tiny" "unzip" )

  # Container package installs will fail unless you do an initial update, the upgrade is optional
  if [ "${CONTAINER}" = true ]; then
    apt-get update && apt-get upgrade -y
  fi

  for i in ${Packages[@]};
  do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ${i}|grep "install ok installed") &> /dev/null
    # echo -e "${LBLUE}Checking for ${i}: ${PKG_OK}${NC}"
    if [ "" = "${PKG_OK}" ]; then
      echo -e "${LBLUE}Installing ${i} since it is not found.${NC}"

      # If we are in a container there is no sudo in Debian
      if [ "${CONTAINER}" = true ]; then
        apt-get --yes install ${i}
      else
        sudo apt-get install ${i} -y
      fi
    fi
  done
}

function setup_gcloud() {
  sudo apt-get install apt-transport-https ca-certificates gnupg
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  sudo apt-get update && sudo apt-get install google-cloud-cli
}

function setup_terraform() {
  curl -LO https://raw.github.com/robertpeteuil/terraform-installer/master/terraform-install.sh
  chmod +x terraform-install.sh
  bash terraform-install 1.3.5
}

function main() {
  check_docker
  install_debian
  setup_gcloud
  #setup_terraform
}

main