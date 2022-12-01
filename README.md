# workshop-codemash-2023

[![DOI](https://zenodo.org/badge/544592682.svg)](https://zenodo.org/badge/latestdoi/544592682)
 [![LaTeX docs](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/latex.yml/badge.svg)](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/latex.yml) [![Bandit](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/bandit.yml/badge.svg)](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/bandit.yml) [![TFsec](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/tfsec.yml/badge.svg)](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/tfsec.yml) [![container image](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/trivy.yml/badge.svg)](https://github.com/devsecfranklin/workshop-codemash-2023/actions/workflows/trivy.yml)

 ## Pre-requisites

 The easiest way to replicate the dev environment under Linux, Mac, Windows is to use
 the "Dev Container" feature in VSCode. None of the following steps should cost you
 money.

* [Follow this link to install Visual Studio Code](https://code.visualstudio.com/download)
* Create a free tier Github account. [Here is the link](https://github.com/join)
* [Use these steps to install git on your computer](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
* Clone this repository to your computer. For example:

```sh
git clone git@github.com:devsecfranklin/workshop-codemash-2023.git
```

* Open the new repository clone folder in VSCode.
* You should [have Docker installed according to this link](https://code.visualstudio.com/docs/devcontainers/containers#_system-requirements).
* In the bottom right of the IDE window you should see a message like so: 

![dev-container](https://github.com/devsecfranklin/workshop-codemash-2023/blob/develop/lab/images/dev-container1.png)

* Click the ``Reopen in Container'' button to proceed.

 ## Full Documentation (work in progress)

<font size="7">[DOWNLOAD LATEST PDF DOCUMENTATION](https://github.com/devsecfranklin/workshop-codemash-2023/blob/develop/lab/workshop-codemash-2023.pdf)</font>

```sh
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████      ██████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████████████████    ████  ████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████████████        ████  ██████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ████        ██████████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████                  ██  ████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████████  ██    ██  ████  ██████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████  ██  ████  ██  ██████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ██  ██    ██  ██  ████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ██  ██████  ██  ██████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ██  ████  ████  ██████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ██  ████  ██  ████████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████  ██  ██  ██  ██████████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████  ██  ██    ██████████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████  ████  ████  ████████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████████  ████    ██  ██  ██████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░██████████████  ██████████  ████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░████████████████          ██████████████░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░▒▒
       WELCOME TO THE WORKSHOP, FRIEND. YOU CAN DO THE THING. WE BELIEVE IN YOU.
```
