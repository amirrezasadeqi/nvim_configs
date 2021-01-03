#!/usr/bin/env bash

# ~/.config/nvim/task_scripts/cmake_c_project_init.sh


function Make_csource() {
	
cat > src/main.c << EOL
// include headers and libraries


int main(int argc, char** argv){

	return 0;
}
EOL
}

function Make_cppsource() {
	
cat > src/main.cpp << EOL
// include headers and libraries


int main(int argc, char** argv){

	return 0;
}
EOL
}


mkdir build src headers && touch CMakeLists.txt 


if [ "$1" == "c" ]
then
	touch src/main.c
	Make_csource
	cmake_template_path="$HOME/.config/nvim/task_scripts/cmake_files/CMakeLists_c.txt"
elif [ "$1" == "cpp" ]
then
	touch src/main.cpp
	Make_cppsource
	cmake_template_path="$HOME/.config/nvim/task_scripts/cmake_files/CMakeLists_cpp.txt"
else
	echo "This Task is just for C and C++ languages."
fi


cat $cmake_template_path > CMakeLists.txt

sed -i "s/PROJECT_NAME/$2/" CMakeLists.txt
sed -i "s/CMAKE_VERSION/$3/" CMakeLists.txt

cd build
cmake ..
mv compile_commands.json ../compile_commands.json


