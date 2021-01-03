#!/usr/bin/env bash

# ~/.config/nvim/task_scripts/node_create.sh


function Make_ros_cppnode() {
	
cat > src/$3.cpp << EOL
// include headers and libraries

#include "ros/ros.h"


int main(int argc, char** argv){

	return 0;
}
EOL
}

function Make_ros_pynode() {
	
cat > src/$3.py << EOL
# include headers and libraries
import rospy

# write your function for example for publisher or ...

if __name__ == '__main__':
	try:
		# function()
	except rospy.ROSInterruptException:
		pass


EOL
}

function Add_nodeTo_cmake() {
cat << EOF >> CMakeLists.txt

add_excutable($3 src/$3.cpp)
target_link_libraries($3 ${catkin_LIBRARIES})

EOF
}


# go to the package directory using its name
roscd $1
# or
# cd src/$1


if [ "$2" == "python" ]
then
	if [ ! -d "scripts" ]
	then
		mkdir scripts
	fi
	touch scripts/$3.py
	Make_ros_pynode
	chmod +x scripts/$3.py
elif [ "$2" == "cpp" ]
then
	if [ ! -d "src" ]
		mkdir src
	fi
	touch src/$3.cpp
	Make_ros_cppnode
	Add_nodeTo_cmake
else
	echo "This Task just supports python and cpp nodes!"
fi

# going back to workspace
cd ../..

catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && if [ -e compile_commands.json ]; then rm compile_commands.json; fi  && mv build/compile_commands.json ./compile_commands.json && if [ ${shell#/bin/} -e "zsh" ]; then source devel/setup.zsh ; else source devel/setup.bash ; fi

