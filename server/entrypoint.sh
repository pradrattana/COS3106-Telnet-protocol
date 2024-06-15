#!/bin/bash

if [ -z "$USER" ]; then
	echo "USER is not set. Please check your .env file."
	exit 1
fi
if [ -z "$PASS" ]; then
	echo "PASS is not set. Please check your .env file."
	exit 1
fi

useradd -m "$USER"
echo -e "$PASS\n$PASS" | passwd "$USER"

xinetd -dontfork
