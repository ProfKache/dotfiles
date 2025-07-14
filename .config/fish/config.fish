if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function nvm
#bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
#end

# source ~/.asdf/asdf.fish

# Set vi mode
set -g fish_key_bindings fish_vi_key_bindings


alias tconf="nvim ~/.tmux.conf"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias md="mkdir -p"

# Set path for rye
# set -Ua fish_user_paths "$HOME/.rye/shims"


# pipenv related aliases
# alias p8="pipenv --python 3.8"
# alias p7="pipenv --python 3.7"
# alias p9="pipenv --python 3.9"
# alias p10="pipenv --python 3.10"
# alias p11="pipenv --python 3.11"
# alias pin="pipenv install"
# alias pind="pipenv install --dev"
# alias psh="pipenv shell"

# django specific aliases
alias rs="python manage.py runserver"
alias mm="python manage.py makemigrations"
alias mg="python manage.py migrate"
alias dp="django-admin startproject"
alias da="python manage.py startapp"
alias csu="python manage.py createsuperuser"
alias shl="python manage.py shell"
alias dt="python manage.py test"

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


# some php shortcuts
# alias composer="/usr/local/bin/composer"
# alias php="/opt/lampp/bin/php"
# alias mysql="/opt/lampp/bin/mysql -u root -p"
# Use it: php /home/profkache/.asdf/installs/php/8.2.24/bin/composer
alias mysql="mysql -u root -p"  # for linux
# alias mysql="/usr/local/mysql/bin/mysql -u root -p"   # for mac os
alias mycli="mycli mysql://root@localhost:3306/mysql"
# alias mysqladmin="/usr/local/mysql/bin/mysqladmin"   # for mac os


# OpenHIM console
# alias openhim-console="cd /var/www/html/openhim-console-1.15.0 && ns"

# Airbyte Console
alias airbyte="bash ~/sources/airbyte/run-ab-platform.sh"

# Reduce typing for PDM command
alias pdr="pdm run"
alias pdi="pdm init"
alias pdp="pdr django-admin startproject config ."

# Apache NI-FI alias
alias nifi="bash /opt/nifi/bin/nifi.sh"


# Setting GOLANG Path
set PATH /usr/local/go/bin $PATH

#set PATH $HOME/Android/Sdk $PATH

# set path for cargo
set PATH ~/.cargo/bin $PATH

# set path for pipenv and pipenv-resolver, pdm etc.
set PATH ~/.local/bin $PATH

# set path for flyctl
set PATH ~/.fly/bin $PATH


# set PATH /opt/glibc-2.38/lib $PATH

# set path for phpenv
# set PATH ~/.phpenv/bin $PATH

# Mac OS path
# set PATH ~/Library/Python/3.12/bin $PATH

# For mac os x only openvpn installation
# set PATH /usr/local/opt/openvpn/sbin $PATH

# Set openssl new path
# set PATH /usr/local/openssl-3.0.7/bin $PATH

set PATH ~/.local/share/coursier/bin $PATH

# Set temporal path
set PATH /opt/temporal $PATH

# ASDF Setup *** New ***  
# set -x PATH ~/.asdf/bin $PATH
set -x PATH ~/go/bin $PATH
set -x PATH ~/bin $PATH  # Adding the version for asdf

# set PATH ~/.asdf/shims $PATH
# set PATH ~/.asdf/installs/nodejs/*/bin $PATH

# Set path for elixir shell history
set -x ERL_AFLAGS "-kernel shell_history enabled"

# set -gx ASDF_DATA_DIR "/home/profkache/.asdf"
# set PATH "$ASDF_DATA_DIR/shims" $PATH

# Set path for python packages installed via pip through asdf
set PATH ~/.asdf/installs/python/*/bin $PATH
# set PATH ~/.asdf/shims ~/.asdf/bin $PATH

# set path for PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# set path for scala programming language and others
# set PATH ~/.sdkman/candidates/*/current/bin/ $PATH

# set PATH __pypackages__/*/lib $PATH
# set --export PYTHONPATH __pypackages__/*/lib
# set -gx PATH $PYTHONPATH $PATH

# set path for PDM
# set PATH (pdm info --packages)/bin/ $PATH
# set -x PYTHONPATH (pdm info --packages)/lib:$PYTHONPATH


set fish_greeting # Turns off the intro fish message when pulling up fish shell
set -gx EDITOR nvim # Sets $EDITOR to nvim (neovim)

## Android for linux
# set --export ANDROID_HOME $HOME/Android/Sdk
# set -gx PATH $ANDROID_HOME/emulator $PATH
# set -gx PATH $ANDROID_HOME/tools $PATH
# set -gx PATH $ANDROID_HOME/tools/bin $PATH
# set -gx PATH $ANDROID_HOME/platform-tools $PATH

## Android for mac os x
# set --export ANDROID_HOME $HOME/Library/Android/sdk
# set -gx PATH $ANDROID_HOME/emulator $PATH
# set -gx PATH $ANDROID_HOME/tools $PATH
# set -gx PATH $ANDROID_HOME/tools/bin $PATH
# set -gx PATH $ANDROID_HOME/platform-tools $PATH

# Function to see available storage in home folder
function hdd
    df -h /home | grep /dev/ | awk '{print $4}'
end

# Create super with virtual environment
function csuf
  echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$argv[1]', '$argv[1]@example.com', 'h@ndl3')" | python manage.py shell
end

# Create super user with python pdm
function csup
  echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$argv[1]', '$argv[1]@example.com', 'h@ndl3')" | pdm run python manage.py shell
end

# Setting up bobthefish theme settings
set -g theme_display_git_default_branch yes
set -g theme_display_virtualenv no
set -g theme_newline_cursor yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_show_exit_status yes

# enable virtual environement in the projects directory
# set -gx PIPENV_VENV_IN_PROJECT enabled

# Abbreviations
abbr sai 'sudo apt install'
abbr sau 'sudo apt update'
abbr ls. 'ls -A | egrep "^\."'
abbr q exit
abbr vim nvim
abbr h 'cd ~/'
abbr wh 'cd ~/workspace'
abbr wdj 'cd ~/workspace/Python/Django'
abbr wp 'cd ~/workspace/Python'
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
abbr fconf 'nvim ~/.config/fish/config.fish'
# abbr metabase 'java -jar /opt/Metabase/metabase.jar'

# some tmux shortcuts
abbr t tmux
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr tl 'tmux ls'
abbr ta 'tmux attach -t'
abbr tk 'tmux kill-session -t'
abbr td 'tmux detach'

# C code execution
abbr gcc 'gcc -Wall -pedantic -Wextra'

abbr poetlocal 'poetry config --local virtualenvs.in-project true'

abbr p8 "python3.8"
abbr p9 "python3.9"
abbr p10 "python3.10"
abbr p11 "python3.11"
abbr p12 "python3.12"
abbr ad 'adb shell am start -n "org.smartregister.nativeform/org.smartregister.nativeform.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER'
# abbr kachevpn "sudo openvpn /opt/openvpn_kache/salim.kachemela@afya.go.tz__ssl_vpn_config.ovpn"
abbr tumevpn "sudo openvpn --client --config /opt/openvpn/sslvpn-salim.kachemela-client-config.ovpn"


# Adding path for maven
# set --export MVN_HOME "$HOME/sources/apache-maven-3.9.6"
# set --export PATH $MVN_HOME/bin $PATH


# Set path for roc language
set -x PATH ~/sources/roc_nightly $PATH

# Change the terminal prompt
starship init fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# end ASDF configuration code


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
