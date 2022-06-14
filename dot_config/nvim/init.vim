source ~/.vimrc

autocmd InsertLeave * :silent !/usr/local/bin/im-select com.google.inputmethod.Japanese.Roman

" plugin manager ---------------------------------------------
if &compatible
  set nocompatible
endif
 
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:toml_dir=expand('~/.config/nvim/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein_lazy.toml'

 " load plugins
 if dein#load_state(s:dein_dir)
   call dein#begin(s:dein_dir)
   call dein#load_toml(s:toml)
   call dein#load_toml(s:toml_lazy, {'lazy': 1})
   call dein#end()
   call dein#save_state()
endif

" install plugins
if dein#check_install()
    call dein#install()
endif
