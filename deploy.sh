#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git config --global user.email "circleci@bot.com"
git config --global user.name "CircleCI"
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..