#!/bin/bash

echo $USER

# transform lowercase the first letter
echo ${USER^}

# transform upercase all word
echo ${USER^^}

# count all letters to word
echo ${#USER}

# split variable content
numbers=012345
echo ${numbers:0:3}

# get all after number to split
echo ${numbers:2}
