#!/usr/bin/env zsh

# ~/.config/nvim/task_scripts/ros_workspace_init.zsh


mkdir src && cd src && catkin_init_workspace && cd .. && catkin_make && shell=$(printenv SHELL) && if [ ${shell#/bin/} = 'zsh' ]; then source devel/setup.zsh ; else source devel/setup.bash ; fi

