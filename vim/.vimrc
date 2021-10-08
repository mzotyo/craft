" -----------------------------------------------------------
" PLUGINS: 

call plug#begin('~/.vim/bundle')
 
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-repeat' " Repeate vim-surrounding commands 
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/tpope/vim-fugitive' " git tool
Plug 'https://github.com/vim-syntastic/syntastic' " sytnax checker / linter

call plug#end()

nnoremap <C-e> :NERDTreeToggle<CR>

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


set encoding=utf-8
set nowrap
set guifont=Lucida\ Console:h11
set relativenumber
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" set cursorline
" syn clear markdownError

" -----------------------------------------------------------
" BACKUP DIR:

" vim's vimrc_example and msvim already sets up backup and swap
" set swap(.swp),backup(~),undo(.udf) directory to vim installation
" Please make sure the directory exists otherwise current directory will be used
set dir=/c/tmp,/c/temp
set backupdir=/c/tmp,/c/temp

" Remember the undo history for file, doesn't work with file collisions
set udf
set udir=/c/tmp,/c/temp

" -----------------------------------------------------------
" BASIC SETTINGS:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" -----------------------------------------------------------
" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomlete any open buffer

" -----------------------------------------------------------
"  TAG JUMPING:

" Create the `tags` file (may need to install cttags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" -----------------------------------------------------------
"  AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with out path trick!)
" - ˘x^] for tags only
" - ^n for anything specified by the 'complete option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" -----------------------------------------------------------
" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0		" disable annoying banner
let g:netrw_brows_split=4	" open in prior window
let g:netrwaltv=1			" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^|\s\s\)zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" -----------------------------------------------------------
"  SNIPPETS:

" Read an empty HTML template and more cursor to title
nnoremap ,html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

