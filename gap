#!/bin/bash
shopt -s expand_aliases
source /etc/profile.d/git_shortcuts.sh
gaa && gcm "$1" && gpush
