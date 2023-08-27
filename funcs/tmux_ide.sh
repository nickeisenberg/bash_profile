#!/usr/bin/env bash

# after each tmux line you can specify the editor you want opened
# eg: python, nvim, vim, bash, etc
# Leaving it black will default to the standard shell

function ide $1 {
	session=$1
	tmux has-session -t $session
	if [ $? != 0 ]
		then
			tmux new-session -s $session -n editor -d  # <dif_editor_name>
			tmux split-window -t "$session:0.0" -h -p 40
			tmux split-window -t "$session:0.1" -v -p 5
			tmux attach -t $session
		else
			tmux attach -t $session
			tmux kill-session
			tmux new-session -s $session -n editor -d 
			tmux split-window -t "$session:0.0" -h
			tmux split-window -t "$session:0.1" -v -p 5
			tmux attach -t $session
			echo 'SESSION ALREADY EXISTS'
		fi
}
