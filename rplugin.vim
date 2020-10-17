" perl plugins


" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/home/amirrezasadeghi/.config/nvim/rplugin/python3/neovim_includePlug_draft.py', [
      \ {'sync': v:false, 'name': 'addPathtojson', 'opts': {}, 'type': 'function'},
      \ {'sync': v:false, 'name': 'findPath', 'opts': {}, 'type': 'function'},
      \ {'sync': v:false, 'name': 'getPathFromUser', 'opts': {}, 'type': 'function'},
      \ {'sync': v:false, 'name': 'IncludePath', 'opts': {}, 'type': 'command'},
     \ ])


" ruby plugins


" python plugins


