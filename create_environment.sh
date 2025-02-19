#!/bin/bash
#This will be creating the durectory where files will be organized

#Taking input to name the directory
read -p "What is your name?: " yourName
mkdir submission_reminder_$yourName

#Creating the subdirectories 
cd submission_reminder_$yourName
mkdir app
mkdir modules
mkdir assets
mkdir config

#Creating the files required
touch app/reminder.sh
touch modules/functions.sh
touch assets/submissions.txt
touch config/config.env
touch startup.sh

#Giving execute permissions to the files that need it
chmod +x app/reminder.sh
chmod +x modules/functions.sh
chmod +x startup.sh

#Populating the reminder.sh
cat << 'EOF' > app/reminder.sh
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
EOF

#Populating the functions.sh
cat << 'EOF' > modules/functions.sh
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
EOF

#Populating the submissions.txt
cat << 'EOF' > assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Larry, Git, submitted
Sahra, Shell Basics, not submitted
Josh, Shell Navigation, not submitted
Sedem, Git, submitted
Kyle, Shell Basics, not submitted
EOF

#Populating the Config.env
cat << 'EOF' > config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
GITH_REMAINING=3
BASICS_REMAINING=1
GITH="Git"
BASICS="Shell Basics"
EOF

#Populating the Startup.sh
cat << 'EOF' > startup.sh
#!/bin/bash
#This is gonna run the reminder app

./app/reminder.sh
EOF


