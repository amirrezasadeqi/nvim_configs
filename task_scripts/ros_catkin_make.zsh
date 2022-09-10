#!/usr/bin/env zsh

# ~/.config/nvim/task_scripts/ros_catkin_make.zsh

catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1

if [ -e build/compile_commands.json ]
then
	if [ -e compile_commands.json ]; then rm compile_commands.json; fi
	mv build/compile_commands.json ./compile_commands.json
else
	echo "Nothing new to export to compile database!"
fi


shell=$(printenv SHELL)

if [ ${shell#/bin/} = 'zsh' ]
then
	source devel/setup.zsh
else
	source devel/setup.bash
fi


