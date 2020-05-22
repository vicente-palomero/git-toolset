#!/bin/bash

source "./src/extract_related_hooks.sh"

path_to_file='./hooks.ini'

#TODO: pre-commit must NOT be hardcoded!!!!
candidates=$(extract_related_hooks $path_to_file 'pre-commit');
echo $candidates
