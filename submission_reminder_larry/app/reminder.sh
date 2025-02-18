#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

# Print remaining time for the Git assignment and run the reminder function
echo "Assignment: $GITH"
echo "Days remaining to submit: $GITH_REMAINING days"
echo "--------------------------------------------"

# Print remaining time for the shell basics assignments and run the reminder function
echo "Assignment: $BASICS"
echo "Days remaining to submit: $BASICS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
