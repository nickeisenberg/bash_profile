#!/usr/bin/env bash

function gcp {
	git add -A
	git commit -m "$1"
	git push -u origin $2
}
