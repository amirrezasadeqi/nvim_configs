#!/usr/bin/env bash

# ~/.config/nvim/task_scripts/bash_scripts/ros_workspace_init.sh


mkdir src && cd src && catkin_init_workspace && cd .. && catkin_make && shell=$(printenv SHELL) && if [ ${shell#/bin/} == "zsh" ]; then source devel/setup.zsh ; else source devel/setup.bash ; fi

