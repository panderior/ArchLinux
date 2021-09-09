#!/bin/bash

# This is a script to automate the git add, commit and push operations ~
# ~ for this directory online repository.

echo -e "\n <= Push to Github repo started =>"

# add changes to git staging area
echo -e "\n => add file changes to staging area ... \n"
git add .

# commit changes to local repo
echo "\n => commit to local repo ... \n"
git commit -m "$1"

# push local commit to online repo
echo "\n => push to online repo ... \n"
git push -u origin main


echo -e "\n < Push to Github repo completed > \n"
