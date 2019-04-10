""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [neo]vim plugins section
"   See
"    - https://github.com/VundleVim/Vundle.vim
"    - https://github.com/junegunn/vim-plug
"   to learn more
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize

let vundle_path='~/.config/nvim/bundle'
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin(vundle_path)

""""""""""""""""""""""""""""""
" Autocompletion for C++
""""""""""""""""""""""""""""""

"
" Let Vundle manage Vundle, required
"

Plugin 'VundleVim/Vundle.vim'

"
" YouCompleteMe: a code-completion engine for Vim
"

Plugin 'Valloric/YouCompleteMe'

"
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
"

Plugin 'ctrlpvim/ctrlp.vim'

"
" Class outline viewer for Vim
"

Plugin 'majutsushi/tagbar'

"
" Deoplete: dark powered asynchronous completion framework for neovim/Vim8
"
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"
" ccls: C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting
"
"Plugin 'MaskRay/ccls'

"
" CoC: Conquer of Completion - intellisense engine for vim8 & neovim
"
"Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"
" Git wrapper
"

Plugin 'tpope/vim-fugitive'

"
" File system explorer
"

Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"
" A vim plugin that manages tag files
"

Plugin 'ludovicchabant/vim-gutentags'

" To debug vim-gutentags, uncomment below line and run :message
"let g:gutentags_trace=1

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim plugins configuration section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Gutentags progress indicator
""""""""""""""""""""""""""""""

" See :help gutentag to learn more (below lines copied from there)

set statusline+=%{gutentags#statusline()}

"augroup MyGutentagsStatusLineRefresher
"    autocmd!
"    autocmd User GutentagsUpdating call lightline#update()
"    autocmd User GutentagsUpdated call lightline#update()
"augroup END

""""""""""""""""""""""""""""""
" NERDTree config
""""""""""""""""""""""""""""""

" Close nerdtree if last tab

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically when vim starts up if no files were specified

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Map a specific key or shortcut to open NERDTree

map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" YouCompleteMe config
""""""""""""""""""""""""""""""

let g:ycm_collect_identifiers_from_tags_files=1

let g:ycm_filepath_completion_use_working_dir=0

""""""""""""""""""""""""""""""
" Tagbar config
""""""""""""""""""""""""""""""

nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""

" Set lines numbers

set number

" Enable mouse

set mouse=a

" Show trailing whitespaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Set red column to indicate 80 characters width

set colorcolumn=80

" Navigate thorugh tabs using CTRL + L (next) and CTRL + H (previous)

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Easy exit from :terminal

tnoremap <Esc> <C-\><C-n>

" Set dark font for light console background

set background=light

" Save file shortcut '\' + 's'

noremap <Leader>s :update<CR>

"
" Remove all trailing whitespace by pressing F5
"

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
