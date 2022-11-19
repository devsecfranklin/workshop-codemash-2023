PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]wolkenschloss\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
GOOGLE_APPLICATION_CREDENTIALS="/workspaces/workshop-codemash-2023/.config/gcloud/gcp-gcs-pso-17b9779c1084.json"
GO111MODULE="auto"
GOPATH=/workspaces/workshop-codemash-2023/go
PATH=$GOPATH/bin:/workspaces/workshop-codemash-2023/bin:/workspaces/workshop-codemash-2023/.local/bin:$PATH
force_color_prompt=yes
alias cat="~/.local/bin/lolcat"
alias ls="ls --color"
lolcat /workspaces/workshop-codemash-2023/tests/art2.txt
