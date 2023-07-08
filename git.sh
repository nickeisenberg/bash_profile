#!/usr/bin/env bash

function gcmp {
	git add -A
	git commit -m "$1"
	git push -u origin $2
}
