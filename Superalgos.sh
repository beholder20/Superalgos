#!/bin/bash
# A menu driven SuperAlgos interface
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

# Function to update system packages
one(){
  echo "User requested system"
  pause
  sudo apt-get update
  pause
  echo "System update complete"
  pause
}

# Function to install SuperAlgos
two(){
  echo "User requested to Install SuperAlgos from GitHub"
    pause
  command -v git >/dev/null 2>&1 ||
    {
       echo >&2 "Git is not installed. Installing..";
       yum install git
    }
    pause
  git clone https://github.com/Superalgos/Superalgos.git
  echo "SuperAlgos installed!"
  pause
}

# Function to Run SuperAlgos
three(){
  echo "User requested Run SuperAlgos"
    pause
  #cd Superalgos
  node run
    pause
}

# Function to stop SuperAlgos
four(){
  echo "User requested Kill SuperAlgos"
    pause
  ps a
    pause
  pkill --signal SIGKILL -e node
      pause
}

# Function to update SuperAlgos
five(){
	echo "test SA update"
        pause

}
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " Welcome to SuperAlgos"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~"
  echo "1. System Update"
  echo "2. Install SuperAlgos from GitHub"
	echo "3. Run SuperAlgos"
	echo "4. Stop SuperAlgos"
  echo "5. Update SuperAlgos"
  echo "6. Quit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 6] " choice
	case $choice in
		1) one ;;
		2) two ;;
    3) three ;;
    4) four ;;
    5) five;;
		6) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do

	show_menus
	read_options
done
