if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function nvm
#bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
#end

source ~/.asdf/asdf.fish


alias tconf="nvim ~/.tmux.conf"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias md="mkdir -p"


# pipenv related aliases
alias p8="pipenv --python 3.8"
alias p7="pipenv --python 3.7"
alias p9="pipenv --python 3.9"
alias p10="pipenv --python 3.10"
alias p11="pipenv --python 3.11"
alias pin="pipenv install"
alias pind="pipenv install --dev"
alias psh="pipenv shell"

# django specific aliases
alias rs="python manage.py runserver"
alias mm="python manage.py makemigrations"
alias mg="python manage.py migrate"
alias dp="django-admin startproject"
alias da="python manage.py startapp"
alias csu="python manage.py createsuperuser"
alias shl="python manage.py shell"
alias mt="python manage.py test"

# git related aliases
alias ga="git add"
alias gc="git commit"
alias gcma="git add . && git commit --amend"
alias gco="git checkout"
alias gsw="git switch"
alias gm="git merge"
alias gst="git status"
alias gss="git status -s"
alias gp="git push"
alias gl="git pull"
alias gr="git rm"
alias grc="git rm --cached"
alias gh="git push heroku main"

# node specific aliases
alias ni="npm install"
alias nid="npm install --dev"
alias nis="npm install --save"
alias ns="npm start"
alias nrs="npm run start"
alias nb="npm build"
alias nrb="npm run build"

# some tmux shortcuts
alias tl="tmux ls"
alias ta="tmux a -t"
alias tn="tmux new -s"
alias td="tmux kill-session -t"

# some php shortcuts
# alias composer="/usr/local/bin/composer"
# alias php="/opt/lampp/bin/php"
# alias mysql="/opt/lampp/bin/mysql -u root -p"
alias mysql="/usr/bin/mysql -u root -p"


# OpenHIM console
alias openhim-console="cd /var/www/html/openhim-console-1.15.0 && ns"

# Reduce typing for PDM command
alias pdr="pdm run"


# Setting GO Path
# set PATH /usr/local/go/bin $PATH
#set PATH $HOME/Android/Sdk $PATH

# set path for cargo
set PATH ~/.cargo/bin $PATH

# set path for pipenv and pipenv-resolver
set PATH ~/.local/bin $PATH

# set path for flyctl
set PATH ~/.fly/bin $PATH


set PATH ~/.local/share/coursier/bin $PATH

# set path for scala programming language and others
set PATH ~/.sdkman/candidates/*/current/bin/ $PATH

# set PATH __pypackages__/*/lib $PATH
# set --export PYTHONPATH __pypackages__/*/lib
# set -gx PATH $PYTHONPATH $PATH

# set path for PDM
# set PATH (pdm info --packages)/bin/ $PATH
# set -x PYTHONPATH (pdm info --packages)/lib:$PYTHONPATH


set fish_greeting # Turns off the intro fish message when pulling up fish shell
set -gx EDITOR nvim # Sets $EDITOR to nvim (neovim)

## Android
set --export ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH


# Function to see available storage in home folder
function hdd
    df -h /home | grep /dev/ | awk '{print $4}'
end

# function csu
#   echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$argv', '$argv@example.com', 'h@ndl3')" | python manage.py shell
#end

# Setting up bobthefish theme settings
set -g theme_display_git_default_branch yes
set -g theme_display_virtualenv no
set -g theme_newline_cursor yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_show_exit_status yes

# enable virtual environement in the projects directory
set -gx PIPENV_VENV_IN_PROJECT enabled

# Abbreviations
abbr sai 'sudo apt install'
abbr sau 'sudo apt update'
abbr ls. 'ls -A | egrep "^\."'
abbr q exit
abbr vim nvim
abbr h 'cd ~/'
abbr wh 'cd ~/workspace'
abbr c clear
abbr - 'cd -'
abbr .. 'cd ../'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr d 'cd ~/Downloads'
abbr doc 'cd ~/Documents'
abbr docb 'cd ~/Documents/books'
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr .conf 'cd ~/.config'
abbr t tmux
abbr fconf 'nvim ~/.config/fish/config.fish'
abbr metabase 'java -jar /opt/Metabase/metabase.jar'
abbr tk 'tmux kill-session -t'
abbr gcc 'gcc -Wall -pedantic -Wextra'
abbr poetlocal 'poetry config --local virtualenvs.in-project true'

abbr py8 "python3.8"
abbr py9 "python3.9"
abbr py10 "python3.10"
abbr py11 "python3.11"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
