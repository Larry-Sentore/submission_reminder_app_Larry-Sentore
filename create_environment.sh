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
