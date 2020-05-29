#!/bin/bash

source "./src/extract_related_hooks.sh"

path_to_file='./hooks.ini'
hook_name="$@"

candidates=$(extract_related_hooks $path_to_file $hook_name);
