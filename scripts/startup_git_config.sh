#!/usr/bin/env bash

function set_user_name {
	VALUE=$(zenity --entry  --title="GIT Setup" --text="Enter your name")

	if [[ $? = 0 ]];
		  	then git config --global user.name "$VALUE"
		  	else set_user_name
	fi
}

function set_email {
	VALUE=$(zenity --entry  --title="GIT Setup" --text="Enter your email")

	if [[ $? = 0 ]];
		then git config --global user.email "$VALUE"
		else set_email
	fi
}

# Check if user.name is set
user_name=$(git config --get user.name)
if [[ -z "$user_name" ]]; then
  set_user_name
else
  echo "Your 'git user.name' is set to: $user_name"
fi

# Check if user.email is set
user_email=$(git config --get user.email)
if [[ -z "$user_email" ]]; then
  set_email
else
  echo "Your 'git user.email' is set to: $user_email"
fi