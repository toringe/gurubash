Guru Bash
========

Are you pining for the good old days? Why not implement some nostalgia in your bash scripts with my Guru Mediation style error messages.

The script will default detect your terminal width and adjust the error message accordingly. Alternatively, you may set a static value to the "width"
variable to get a fixed width.


Example
-------
`
!/bin/bash
source "guru.sh"
if [ <error condition> ]; then
  # Display Guru Meditation error with the error code of 123
  guru 123
fi
`



