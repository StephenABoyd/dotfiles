#!/bin/sh

workGitEmail="${WORK_EMAIL}"
personalGitEmail="${PERSONAL_EMAIL}"

currentGitEmail=$(git config user.email)

if [ "$currentGitEmail" = "$workGitEmail" ]; then
  currentGitEmail=$personalGitEmail
else
  currentGitEmail=$workGitEmail
fi

$(git config --global user.email "$currentGitEmail")

echo "Swapping git email to:" $(git config user.email)

