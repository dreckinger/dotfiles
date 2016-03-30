source ~/.bashrc
export LC_CTYPE=en_US.UTF-8

export MANPAGER='col -bx | vim -c ":set ft=man nonu nolist" -R -'
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
		. /opt/local/etc/profile.d/bash_completion.sh
	fi


source ~/.xsh
eval $(thefuck --alias)
