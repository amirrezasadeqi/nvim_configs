# nvim_configs
This is a repository which contains my configs and self written plugins for neovim.


## How to Install the rplugin?
To install my remote plugin for adding an arbitrary include path to C/C++ Projects
you just copy the python file of the remote plugin(I think it must be executable)
into "$HOME/.config/nvim/rplugin/python3/". After that you just run ":UpdateRemotePlugins"
in the nvim, and it would be ready to go. Note that if you write the plugin in python2
the last directory would be python2. 
To use This Plugin you just run ":IncludePath" and the rest would be easy. before it you
must have set up the "compile_commands.json" file and move it into the top level workspace
("workspace" (this directory!) -> "src", ... ) directory. now with this plugin if you suddenly
need some header file which is not configured in the compile_commands.json file, you just add its 
include path using this plugin and you will have the completion for it because the clangd uses 
the json file and this plugin adds the include path to that json file and consequently the clangd
sees that path in the json file and uses the header files that are in there for completion.
in this way you will not need to stop you working progress to add the include directory to
"CMakeLists.txt" file and regenerate the compile_commands.json file to have the completion.
so you write your code and after that you can modify your "CMakeLists.txt" to correctly compile
your code without any interuptions!!!(no need to VSCode ":)" ).

Note: you must reload the coc-clangd for coc.nvim after update of compile_commands.json file to have
auto completion for new headers and libraries. you can do this by simply ":CocRestart".

Note: from "2021-01-03 03:11" remote plugin is updated and we have ":IncludePathG" for globally add
include and ":IncludePathL" for locally add include path.

Note: alot of tasks are added via coc-tasks and asynctasks plugin for python, C/C++, ros development
and the corresponding scripts and files are pushed(2021-01-03 03:16).

Note(2021-01-04 02:04): I did remember to say that the local and global inclusion now has embedded reloading 
of coc.nvim by running command ':CocRestart'. so you add the inclusion and let it go. after automatic reloading
you will have auto completion for included path. for example you can add the ros include path to have ros auto 
completion. Enjoy it!


### in the future ...




