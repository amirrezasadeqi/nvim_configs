" File type detection for roslaunch files
" I love this thing(line):
au BufRead,BufNewFile *.launch set filetype=xml
au BufRead,BufNewFile *.urdf set filetype=xml
au BufRead,BufNewFile *.xacro set filetype=xml

" adding some settings for python dev
au BufRead,BufNewFile python
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix
  \ set foldmethod=indent
  \ set foldlevel=99

