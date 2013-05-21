#!/bin/bash
################################################################################
#
# Guru Bash
# ---------
#
# Pining for the good old days? Why not implement some nostalgia in your shell
# scripts with my Guru Mediation style error message. 
#
# EXAMPLE:
#
#  #!/bin/bash
#  source "guru.sh"
#  if [ <error condition> ]; then
#    # Display Guru Meditation error with the error code of 123
#    guru 123
#  fi
#  
# CONFIGURATON:
#
# The script will default detect your terminal width and adjust the error 
# message accordingly. Alternatively, you may set a static value to the "width"
# variable to get a fixed width.
#
# AUTHOR:
#
# Tor Inge Skaar - tor.inge.skaar|gmail.com
#  
################################################################################

function guru {

  err=$1 # User defined error code
	if [ -z "$err" ]; then
		err=0
	fi

	width=`tput cols`
	line1="Software Failure. Press any button to continue."
	line2="Guru Meditation #"`printf "%08d" $err`".48454C50"

	space=$(( width - ${#line1} - 4 ))
	r=$(( space % 2 ))
	l1_r=$(( space / 2 ))
	if [ $r -eq 0 ]; then
		l1_l=$l1_r
	else
		l1_l=$(( l1_r + 1 ))
	fi
	space=$(( width - ${#line2} - 4 ))
	r=$(( space % 2 ))
	l2_r=$(( space / 2 ))
	if [ $r -eq 0 ]; then
		l2_l=$l2_r
	else
		l2_l=$(( l2_r + 1 ))
	fi

	echo -e "\033[0;31;41m`awk 'BEGIN{for(c=0;c<'"${width}"';c++) printf "=";}'`\033[0m"
	echo -e "\033[0;31;41m  \033[0m`awk 'BEGIN{for(c=0;c<'"$((width - 4))"';c++) printf "\040";}'`\033[0;31;41m  \033[0m"
	echo -e "\033[0;31;41m  \033[0m`awk 'BEGIN{for(c=0;c<'"${l1_l}"';c++) printf "\040";}'`\033[1;31m${line1}\033[0m`awk 'BEGIN{for(c=0;c<'"${l1_r}"';c++) printf "\040";}'`\033[0;31;41m  \033[0m"
	echo -e "\033[0;31;41m  \033[0m`awk 'BEGIN{for(c=0;c<'"${l2_l}"';c++) printf "\040";}'`\033[1;31m${line2}\033[0m`awk 'BEGIN{for(c=0;c<'"${l2_r}"';c++) printf "\040";}'`\033[0;31;41m  \033[0m"
	echo -e "\033[0;31;41m  \033[0m`awk 'BEGIN{for(c=0;c<'"$((width - 4))"';c++) printf "\040";}'`\033[0;31;41m  \033[0m"
	echo -e "\033[0;31;41m`awk 'BEGIN{for(c=0;c<'"${width}"';c++) printf "=";}'`\033[0m"
	read a
	exit 1
}
