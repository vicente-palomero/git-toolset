#!/bin/bash

function count_lines_until_next_hook() {
    local filename=$1
    local start_line_number=$2
    local next_line=$((start_line_number+1))
    local candidate_line_number=`tail -n +$next_line $filename | grep -n '\[' | cut -d':' -f1`
    echo $((candidate_line_number-1))

}

function extract_related_hooks() {
    local filename=$1
    local hook_group=$2
    local max_lines=$(wc -l $filename)
    local hook_line_number=`cat $filename | grep -n $hook_group | cut -d':' -f1`
    local lines_till_next_hook=$(count_lines_until_next_hook $filename $hook_line_number)

    if [[ $lines_till_next_hook -eq -1 ]]; then
	lines_till_next_hook=$max_lines
    fi

    related_hooks=$(cat $filename |
        grep -A$lines_till_next_hook $hook_group |
	grep -v $hook_group |
	grep "=" |
	sed 's/ //g')

    echo $related_hooks
}
