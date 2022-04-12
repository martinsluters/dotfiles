#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/projects

# Personal
git clone git@github.com:martinsluters/delivery-information-injected.git $PROJECTS/delivery-information-injected
git clone git@github.com:martinsluters/resume.git $PROJECTS/resume
git clone git@github.com:martinsluters/wpregistrars.git $PROJECTS/wpregistrars
git clone git@github.com:martinsluters/usefulcodesnippets.git $PROJECTS/usefulcodesnippets
git clone git@github.com:martinsluters/php-compatibility-check-tool.git $PROJECTS/php-compatibility-check-tool

