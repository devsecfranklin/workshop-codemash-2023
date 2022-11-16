PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]wolkenschloss\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
GOOGLE_APPLICATION_CREDENTIALS="/home/franklin/.config/gcloud/gcp-gcs-pso-17b9779c1084.json"
GO111MODULE="auto"
GOPATH=/home/`whoami`/go
PATH=$GOPATH/bin:~/bin:~/.local/bin:$PATH
force_color_prompt=yes
#make go
make python
alias cat="~/.local/bin/lolcat"
lolcat tests/art.txt
