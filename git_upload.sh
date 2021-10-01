#!/bin/bash

# This is a script to automate the git add, commit and push operations ~
# ~ for this directory online repository.

# Author: panderior
# References: various

echo -e "\n ---------------------------------"
echo -e " <= Push to Github repo started =>"
echo -e " ---------------------------------\n"

echo -e "\n => add file changes to staging area ... \n"
# add changes to git staging area
git add .

echo -e " => commit to local repo ... \n"
# commit changes to local repo
# the commit note is grabbed from the first argument when the script is ran
git commit -m "$1"

echo -e "\n => push to online repo ... \n"
# push local commit to online repo
git push -u origin main

echo -e "\n ---------------------------------"
echo -e " < Push to Github repo completed >"
echo -e " ---------------------------------\n"
