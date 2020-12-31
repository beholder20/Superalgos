#!/bin/bash
SA1='Choose your option:'
Options=("Update" "Run SuperAlgos" "Kill SuperAlgos" "Quit")
select choice in "${Options[@]}"; do
    case $choice in
        "Update")
            echo "User requested $choice"
            sudo apt-get update
	    # optionally call a function or run some code here
            ;;
        "Run SuperAlgos")
            echo "User requested $choice"
            cd Superalgos-master
            node run
	    # optionally call a function or run some code here
            ;;
        "Kill SuperAlgos")
            echo "User requested $choice"
            ps a
            echo "Choose PID:"
      # optionally call a function or run some code here
        break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
