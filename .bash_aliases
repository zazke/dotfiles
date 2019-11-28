alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'
alias diff2='diff --color=always -y'
alias dir='dir --color=auto'
alias grepc='grep --color=auto -i'	# color and ...
alias la='ls -A'
alias ll='ls -l -h'
alias lla='ll -A'
alias ls='ls --color=auto'
#alias mv='mv -v'
#alias cp='cp -v'
#alias less='less -Ri'		# make less's searches case insensitive and
				# colorized
LESS=Ri

# cosmetic
# ========
alias :q='cowsay -d "this isn'\''t Vim"'  # To scape single quotes in single
					  # quoted string first finish opened
					  # string and add the scaped quote
					  # (\').
alias :w="cowsay -b \"this isn't Vim\""
alias miola='cowsay -e ^^ "te extraño, mi galletita"'
alias miola2='cowsay -e ^^ "🌊Nandita 💃 bonita 🌊"'
