if status is-interactive
    # Commands to run in interactive sessions can go here
end

# source ~/.asdf/asdf.fish

# Set vi mode
set -g fish_key_bindings fish_vi_key_bindings


alias tconf="nvim ~/.tmux.conf"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# eval (tmuxifier init - fish)
set -gx PATH "~/.tmuxifier/bin" $PATH

alias md="mkdir -p"

# alias for Yazi i.e terminal file manager
alias yazi="flatpak run io.github.sxyazi.yazi"

# django specific aliases
alias rs="python manage.py runserver"
alias mm="python manage.py makemigrations"
alias mg="python manage.py migrate"
alias dp="django-admin startproject"
alias da="python manage.py startapp"
alias csu="python manage.py createsuperuser"
alias shl="python manage.py shell"
alias dt="python manage.py test"


alias mysql="mysql -u root -p"  # for linux
# alias mysql="/usr/local/mysql/bin/mysql -u root -p"   # for mac os
alias mycli="mycli mysql://root@localhost:3306/mysql"
# alias mysqladmin="/usr/local/mysql/bin/mysqladmin"   # for mac os


# OpenHIM console
# alias openhim-console="cd /var/www/html/openhim-console-1.15.0 && ns"

# Airbyte Console
# alias airbyte="bash ~/sources/airbyte/run-ab-platform.sh"

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


set PATH ~/.local/share/coursier/bin $PATH

# Set temporal path
set PATH /opt/temporal $PATH

# ASDF Setup *** New ***  
# set -x PATH ~/.asdf/bin $PATH
# set -x PATH ~/go/bin $PATH
set -x PATH ~/bin $PATH  # Adding the version for asdf

# Set path for node
set -x PATH ~/.asdf/installs/nodejs/*/bin $PATH

# Set path for elixir shell history
set -x ERL_AFLAGS "-kernel shell_history enabled"

# Set path for mix
set -Ux PATH $HOME/.asdf/installs/elixir/1.18.3-otp-27/.mix/escripts $PATH

# Set path for python packages installed via pip through asdf
set PATH ~/.asdf/installs/python/*/bin $PATH
# set PATH ~/.asdf/shims ~/.asdf/bin $PATH

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
abbr c clear
abbr - 'cd -'
abbr .. 'cd ../'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr d 'cd ~/Downloads'
abbr doc 'cd ~/Documents'
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'

# some tmux shortcuts
abbr t tmux
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr tl 'tmux ls'
abbr ta 'tmux attach -t'
abbr tk 'tmux kill-session -t'
abbr td 'tmux detach'

# C code execution
abbr gcc 'gcc -Wall -pedantic -Wextra'

abbr ad 'adb shell am start -n "org.smartregister.nativeform/org.smartregister.nativeform.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER'
# abbr kachevpn "sudo openvpn /opt/openvpn_kache/salim.kachemela@afya.go.tz__ssl_vpn_config.ovpn"
abbr tumevpn "sudo openvpn --client --config /opt/openvpn/sslvpn-salim.kachemela-client-config.ovpn"


# Set path for roc language
set -x PATH ~/sources/roc_nightly $PATH

# Set path for exercism
set -x PATH ~/sources/exercism $PATH

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

# Activate Virtual environment with pdm by typing 'pdm shell'
function pdm
  set cmd $argv[1]

  if test "$cmd" = "shell"
      eval (pdm venv activate)
  else
      command pdm $argv
  end
end


ulimit -n 65535


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
