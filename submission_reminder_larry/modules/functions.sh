#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
	fi	

	if [[ "$assignment" == "$GITH" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $GITH assignment!"
        fi

	if [[ "$assignment" == "$BASICS" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $BASICS assignment!"
        fi

    done < <(tail -n +2 "$submissions_file") # Skip the header
}
