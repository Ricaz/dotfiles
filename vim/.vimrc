if has('nvim')
  language en_US
  let configpath = stdpath('config')

  let s:fontsize = 12

  noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
  noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
  inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
  inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
else
  let configpath='~/.vim'
endif

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

" Don't be vi-compatible
set nocompatible

" Disable filetype to load plugins better
filetype off

" Install Vim-Plug if not present
if empty(glob(configpath . '/autoload/plug.vim'))
  silent execute '!curl --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -fLo ' . configpath . '/autoload/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(configpath . '/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/mojo.vim'
Plug 'chase/vim-ansible-yaml'
" Plugin 'scrooloose/nerdtree.git'
" Plugin 'jiangmiao/auto-pairs'
call plug#end()

" Linenumber colors
set cursorline
set nocursorcolumn
highlight clear CursorLine
highlight LineNR ctermfg=white ctermbg=233
highlight CursorLineNR cterm=bold ctermbg=234 ctermfg=yellow
highlight CursorLine ctermbg=234
highlight CursorColumn ctermbg=232

" Set leader to space
let mapleader=" "


" Plugin options
""""""""""""""""

" Only start emmet in html or css
let g:user_emmet_leader_key='<C-X>'
let g:user_emmet_install_global = 0
if exists(":EmmetInstall")
  autocmd FileType html,css EmmetInstall
endif

" Mojo highlighting
let g:mojo_highlight_data = 1


" Bind FZF
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>b :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Next/previous buffer (for editing multiple files)
nnoremap <leader>] :next<CR>
nnoremap <leader>[ :prev<CR>

" Copy/paste buffers
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Set closetag filenamghes
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.ep'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.ep'

" Force > by tapping <leader> first
let g:closetag_close_shortcut = '<leader>>'

" Basic settings
set number
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smarttab
set autoindent
set laststatus=2
set nobackup
set nowritebackup

" Filetype detection
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.nmis set syntax=perl
  autocmd BufNewFile,BufRead *.html.ep setfiletype html.ep 
augroup END

" Don't litter swp files everywhere
set directory^=$HOME/.vim/tmp//
" Search
set incsearch
set ignorecase
set smartcase
set showmatch

" Use % to jump between pairs
set matchpairs+=<:>
runtime! macros/matchit.vim

" Visualize tabs and newlines
set listchars=tab:▶\ ,eol:¬,extends:…,precedes:…
set nolist
map <leader>l :set list!<CR> " Toggle
highlight NonText ctermfg=8
highlight SpecialKey ctermfg=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Exit insert mode
inoremap jj <ESC>

" Fix tabs
nnoremap <leader>t :%retab!<CR>

" Execute current file
nnoremap <leader>r :!%:p<Enter>
" Wait for arguments
nnoremap <F9> :!%:p

" Resizing panes
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Toggle seach highlight
nnoremap <F2> :set hlsearch!<CR>

" Toggle relative numbers
nnoremap <Leader>n :set relativenumber!<CR>

" Write as sudo
cmap w!! w !sudo tee > /dev/null %

" Rebind keys for easily switching between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F1> :NERDTreeToggle<CR>
set splitbelow
set splitright

" Tab indents in Visual Mode
vmap <tab> >gv
vmap <s-tab> <gv

" Auto-close pairs
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" Colors
set t_Co=256
set background=dark

" Fix YAML indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Vimdiff quickfix
highlight DiffAdd  cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
