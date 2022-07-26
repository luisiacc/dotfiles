# projects paths
alias acuweb='cd ~/projects/acubliss/webui/'
alias jumpf='cd /mnt/c/Users/acc/projects__/JumpForceStats/'
alias p='git push -v'
alias pf='git push --force -v'
alias kitty='~/.local/kitty.app/bin/kitty'
alias chrome="nohup google-chrome &"
alias dpyc="find . -name \"*.pyc\" -exec rm -rf {} \;"


alias sp='source ~/.profile'
alias ..='cd ..'
alias k='kitty --detach'

alias applyssh='eval $(ssh-agent -s);ssh-add ~/.ssh/key'
alias mrunserver='poetry run python manage.py runserver 8000'

alias acucore='cd ~/projects/acubliss/core/'
alias acuweb2='cd ~/projects/acubliss/client/'

# Celery
alias runcelery="senv && poetry run celery -A common purge -f && poetry run celery -A common worker --loglevel=info --queues slow,celery"
alias runbeat="senv && poetry run celery -A common purge -f && poetry run celery -A common.celery beat -l info"

# REDIS
alias senv="set -a; source .env; set +a"
alias runredis="sudo service redis-server start"
alias runpost="sudo service postgresql start"
alias postg="sudo -u postgres -i"

function runAcubliss(){
	tmux new-session \; \
        send-keys 'acucore; senv; runcore' C-m \; \
        split-window -h \; \
        send-keys 'acucore; senv; runbeat' C-m \; \
        split-window -v \; \
        send-keys 'acuweb2; yarn run start' C-m \; \
        split-window -v \; \
        send-keys 'acucore; senv; runcelery' C-m \; \
        select-pane -U \;
	}

function runPortal(){
	tmux new-session \; \
        send-keys 'acucore; senv; runcore' C-m \; \
        split-window -h \; \
        send-keys 'acuweb2; yarn start --no-hot' C-m \; \
        select-pane -U \;
	}

# Git
alias push="git push origin HEAD -v"
alias pushf="git push origin HEAD --force -v"
alias pullmaster="git pull origin master -v"


# Poetry
alias ps="set -a; source .env; set +a && poetry shell"

# Ginseng
alias grw="cd webui/ && yarn run start"
alias grp="cd core/ && ps"

# Django
alias runcore="senv; poetry run python manage.py runserver 8000"
alias drs="set -a; source .env; set +a && ./manage.py runserver"
alias dmm="./manage.py makemigrations"
alias dmt="./manage.py migrate tenants --executor parallel"

alias v="nvim ."

# ssh
alias essh="eval $(ssh-agent -s)"
alias sad="ssh-add ~/.ssh/key"

# ctags
alias gtags="ctags -R --exclude=node_modules --exclude=.venv"

# webpack inspect
alias dnode="node --inspect node_modules/webpack-dev-server/bin/webpack-dev-server.js"

alias modifyalias='nvim ~/.bash_aliases'
alias df='/usr/bin/git --git-dir=/home/acc/.dotfiles/ --work-tree=/home/acc $@'
