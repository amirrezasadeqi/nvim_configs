# What are in this Big Update?
## 2020-12-29 04:51

This file contains information about What are done in this update and what will
be done in future.


## List of coc extensions

	1. coc-clangd
	2. coc-cmake
	3. coc-pairs
	4. coc-tasks
	5. coc-snippets
	6. coc-texlab
	7. coc-json
	8. coc-sh
	9. coc-marketplace
	10. coc-python
	11. coc-fzf-preview (@https://github.com/yuki-ycino/fzf-preview.vim/)
			     (there was some lags some where that i can't remember
			     so i used the fzf.vim which works like a charm.)
	12. coc-xml
	13. coc-yaml
	14. ros-snippets (not from coc.nvim but coc list it maybe because it
			  is actually from vscode and coc have same structure.) 

in the following i will explain every thing that at the momment i remember and i 
i think it is important.

1. sniprun plugin: this plugin is very nice. you can use it to run your code from 
editor but important feature is that you can run a block of code like you do in 
jupyter notebook and this is a fancy feature for python development.

2. vimspector: maybe the most tricky part was setting up this plugin. it is a greate
debugger plugin for neovim.
	1. install it via plugin manager.
	2. install the gadget for your desired language with :VimspectorInstall
	   command.
	3. setup your keymap.
	4. add .vimspector.json file to your workspace directory.
	5. run editor and press the key map for start the debugging process.
	6. enjoy it!

you can use the youtube tutorials for set it up and set the keybindings and workflow:

	1. https://www.youtube.com/watch?v=U4KLYhkIgB4
	2. https://www.youtube.com/watch?v=AnTX2mtOl9Q
	3. https://www.youtube.com/watch?v=anYJg5GX2xI
	4. https://github.com/awesome-streamers/awesome-streamerrc (for some keybindings)

TO DO: write some tasks for setup the project and .vimspector files for it.

other debugging plugins are :
	1. https://github.com/sakhnik/nvim-gdb : bare metal for C/C++/python
	2. builtin debugger: termdebug just for gdb:

		1. add with ':packadd termdebug'
		2. run it with 'Termdebug'(https://www.dannyadam.com/blog/2019/05/debugging-in-vim/)



3. https://github.com/szw/vim-maximizer : a plugin for toggle a vim tab between
   maximized size and normal size.

4. https://github.com/mg979/vim-visual-multi : it is not added but is a good plugin
   for multi cursor editing in vim. add it or a better option when you have learned
   it good because adding it without knowing how it works makes alot of confusions
   and headaches.

5. vim-surround and vim-repeat from 'tpope' repository for adding () around of 
   words and word objects and repeate it several times with '.'. A nice tutorial 
   is presented in:
   	1. http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/

6. https://github.com/junegunn/fzf
   https://github.com/junegunn/fzf.vim

   These are two real monsters. the simplest thing which i have done with it is 
   to use it as ctrl+p for openning the files in neovim. read the fzf repository 
   in details. it contains alot of things for zsh and bash completion also. note 
   that use the installer script for full feature support of fzf. has some nasty 
   behaviors with bash but i made it to work correct in my dot files. note that 
   this repo also works for tmux fzf plugins and oh-my-zsh fzf plugin.

7. https://github.com/skywind3000/asynctasks.vim
   https://github.com/skywind3000/asyncrun.vim
   https://github.com/voldikss/coc-tasks

   these plugins are for setting a task structure like in vscode and coc-tasks is
   the frontend for them that have some autocomplete features for writing .task
   files. I think you can use this plugins for writig a task like create ros workspace
   and map it to a keybind for actually creating a environment like vscode ros 
   plugin. it would be nice.

   https://github.com/ms-iot/vscode-ros : microsoft repository for ros vscode ros
   plugin. it is a good roadmap to create "tasks" and other necessary things for 
   ros plugin for neovim. I will do it in future. i may need bellow repositories
   in this way:
	1. https://github.com/VincentCordobes/convert-snippets :to convert vscode
								and vim snippets to
								each other.

	2. https://github.com/pijaro/ros-snippets
	   https://github.com/SweiLz/ROS-Snippets

	   vscode plugins which contains ros snippets. coc-snippets works with them
	   like a charm. note that launch, urdf and xacro files are xml file and 
	   in the init.vim file i set the filetype for them to xml so i use the 
	   coc-xml plugin for interpretting them and automatically it loads the 
	   snippets. the second repo 'SweiLz' is more comperhensive.

	   To Do: in the future i must have some other snippets for msg files to
	   complete the plugins to the high-end.
	   "https://gist.github.com/nalt/dfa2abc9d2e3ae4feb82ca5608090387" : this 
	   repository contains some xsd dtd files which contains the tags and snippets
	   and actually xml grammers for launch files. the plugis were more cleaner
	   experience but this is also a way that you can test.

8. https://github.com/honza/vim-snippets
   
   a repository which contains alot of snippets for alot of languages. works well with
   coc-snippets. there is a tutorial for them in:
   	1. https://www.chrisatmachine.com/Neovim/17-snippets/

	and also the way you can create new snippets. use them for creating new snippets
	for msg and other ros related things and your work related things.

9. https://github.com/fannheyward/coc-texlab

   A plugin for writing latex code in neovim.

10. https://github.com/bash-lsp/bash-language-server#neovim : bash language server
    i think it is necessary for coc-sh.

11. https://github.com/neoclide/coc-python : works like a charm for python development 
    for both python 2 and 3 i think. it is like vscode python plugin and works nice.

    you also can use coc-jedi and jedi-language-server that works the same but in 
    searching workspace symbols with <space>s the coc-python was faster and actually
    i liked coc-python because of nice vscode structure that you have some command for
    setting interpreter. so i used coc-python. coc-jedi and jedi-language-server 
    repositories are:

    	1. https://github.com/pappasam/coc-jedi
	2. https://github.com/pappasam/jedi-language-server


these were what i remember at the momment about the updates. at this stage neovim 
is actually transfored to a lightweight editor. don't forget cscope and ctags and related
plugins. in the future i will write some tasks for automization of my workflow and 
more specifically toward having a workflow for ros development.


# Good Luck !
