#!/bin/bash

source "./src/extract_related_hooks.sh"

path_to_file='./hooks.ini'
hook_name="$@"

candidates=$(extract_related_hooks $path_to_file $hook_name);
echo $candidates
for candidate in $candidates; do
    IFS="="
    read -ra splitted <<< "$candidate"
    hook_name=${splitted[0]}
    path=${splitted[1]}
    echo "Running hook $hook_name"
    $path
    echo "Done."
done
