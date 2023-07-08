#!/usr/bin/env bash

function ide {
	session="new"
	tmux has-session -t $session
	if [ $? != 0 ]
		then
			tmux new-session -s $session -n editor -d zsh
			tmux split-window -t "$session:0.0" -h zsh
			tmux split-window -t "$session:0.1" -v -p 5 zsh
			tmux attach -t $session
		else
			tmux attach -t $session
			tmux kill-session
			tmux new-session -s $session -n editor -d zsh
			tmux split-window -t "$session:0.0" -h zsh
			tmux split-window -t "$session:0.1" -v -p 5 zsh
			tmux attach -t $session
			echo 'SESSION ALREADY EXISTS'
		fi
}
