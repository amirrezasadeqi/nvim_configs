#!/usr/bin/env zsh

# ~/.config/nvim/task_scripts/ros_create_pkg.zsh

cd src

# support of variable inputs for dependencies
#############################################
argn=$#
i=0

for arg do
   shift
   i=$(( i + 1 ))

   if [ "$i" -eq "1" ]; then
       set -- "$@" catkin_create_pkg "$arg"
   else
       set -- "$@" "$arg"
   fi
done
# this is actually catkin_create_pkg command 
command "$@"

cd .. 
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1

if [ -e build/compile_commands.json ]
then
	if [ -e compile_commands.json ]; then rm compile_commands.json; fi
	mv build/compile_commands.json ./compile_commands.json
else
	echo "Nothing new to export to compile database!"
fi


shell=$(printenv SHELL)

if [ ${shell#/bin/} = 'zsh' ]; then
   source devel/setup.zsh
else
   source devel/setup.bash
fi



