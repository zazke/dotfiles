if [ "$SHELL" = "/bin/bash" ]; then
    . ~/.bashrc
fi


# Variables
# ======================================================================

# redundant but useful 
# (XDG = Cross-Desktop Group, 
# more info at https://wiki.archlinux.org/index.php/XDG_Base_Directory)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
#export XDG_DATA_DIRS="/usr/local/share:/usr/share"
#export XDG_CONFIG_DIRS="/etc/xdg"


# Fun
# ======================================================================

echo "Welcome back $LOGNAME"
