# Shortcuts
# ======================================================================
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'
alias evrc='vim ~/.config/vim/vimrc'
alias ebrc='vim ~/.bashrc && source ~/.bashrc'


# Common program's options
# ======================================================================

# coretools
alias diff2='diff --color=always -y'
alias dir='dir --color=auto'
alias grep='grep --color=auto -i'       # color case-insensitive
alias la='ls -A'
alias ll='ls -l -h'
alias lla='ll -A'
alias ls='ls --color=auto --group-directories-first --classify'
#alias less='less -Ri'          # make less's searches case insensitive and
                                # colorized
LESS=Ri                         # TODO move to an appropiate place
alias gcc='gcc -g -std=c99 -lm'
alias ed='ed -p "* "'
alias diff='diff -s'

# Other program's options
# ======================================================================
#alias feh='feh -g 640x480 -S filename'  # opens files sorted by filename
alias feh='feh -g 640x480 --auto-zoom --scale-down --on-last-slide hold'
alias feht='feh -Tthumb_s'
alias fehfx='feh -Tfs --slideshow-delay'
alias fehfrx='feh -Tfs --recursive --slideshow-delay'
alias units='units --verbose'


# Precautionary
# ======================================================================
alias rm='rm -I'          # Promt before removing more than 3 files
alias mv='mv -i'          # Promt before overwrite
alias cp='cp -i'          # same


# Quick tools
# ======================================================================
alias pdfreduce='gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook'
alias youtube-dl_info='youtube-dl --get-filename --get-format --get-duration --get-description'
alias youtube-dl_fast='youtube-dl --format "best[height<=720]" -o '\''%(title)s.%(ext)s'\'
alias mpv_webcam='mpv av://v4l2:/dev/video0'    # retrived from the Archwiki


# Cosmetic
# ======================================================================
alias :q='cowsay -d "this isn'\''t Vim"'  # To scape single quotes in single
                                          # quoted string first finish opened
                                          # string and add the scaped quote
                                          # (\').
alias :w="cowsay -b \"this isn't Vim\""
alias miola='cowsay -e ^^ "te extraño, mi galletita"'
alias miola2='cowsay -e ^^ "🌊Nandita 💃 bonita 🌊"'
