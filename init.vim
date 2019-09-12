""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [neo]vim plugins section
"
" See:
"  - https://github.com/VundleVim/Vundle.vim
"  - https://github.com/junegunn/vim-plug
" to learn more about Vundle plugin manager.
"
" Vundle's brief help:
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginList       - lists configured plugins
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"
" Before applying this configuration run:
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
" to install Vundle plugin manager.

" To set nvim when you type 'vim' run:
"   update-alternatives --config vim
" and select nvim as your default vim binary.
"
" See `:h vundle` for more details or wiki for FAQ.
" Put your non-Plugin stuff after this line.
"
" Options set by default by nvim (not needed to set explicitly):
"  filetype plugin indent on
"  set autoindent
"  set nocompatible
"  smarttab

" See `:help nvim-defaults` to learn more.
"
" Other options that are not needed:
"  filetype off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Set the runtime path to include Vundle and initialize

let vundle_path='~/.config/nvim/bundle'
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin(vundle_path)

" Let Vundle manage Vundle (plug-in manager; required)

Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe: a code-completion engine for Vim
" See also: https://jonasdevlieghere.com/a-better-youcompleteme-config/

Plugin 'Valloric/YouCompleteMe'

" Asynchronous Lint Engine - plugin providing linting (syntax checking and
" semantic errors)

Plugin 'dense-analysis/ale'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim

Plugin 'ctrlpvim/ctrlp.vim'

" Class outline viewer for Vim (press F8 to activate)

Plugin 'majutsushi/tagbar'

" Deoplete: dark powered asynchronous completion framework for neovim/Vim8
"
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Adds snippet support to Vim; snippets are small templates for commonly used
" code that you can fill in on the fly; installing deoplete is recommended
"if !has('nvim')
"  Plugin 'roxma/nvim-yarp'
"  Plugin 'roxma/vim-hug-neovim-rpc'
"endif
"
"Plugin 'Shougo/neosnippet.vim'
"Plugin 'Shougo/neosnippet-snippets'

" ccls: C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting
"
"Plugin 'MaskRay/ccls'

" CoC: Conquer of Completion - intellisense engine for vim8 & neovim
"
"Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Git wrapper

Plugin 'tpope/vim-fugitive'

" Plugin which shows a git diff in the gutter (sign column) and stages/undoes
" (partial) hunks

Plugin 'airblade/vim-gitgutter'

" File system explorer

Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin to read or write files with sudo command
" Type ':w suda://%' to save with sudo.

Plugin 'lambdalisue/suda.vim'

" Makes working with CMake a little nicer

Plugin 'vhdirk/vim-cmake'

" Lean & mean status/tabline for vim that's light as air

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" A vim plugin that manages tag files
"
" Gutentags is a plugin that takes care of the much needed management of tags
" files in Vim. It will (re)generate tag files as you work while staying
" completely out of your way.
"
" NOTE: Gutentags prepends tags file path to tags variable (see: `:set tags`)
" To manually update tags run :GutentagsUpdate (or :verbose GutentagsUpdate)
" To see debug message while Gutentag is working run :GutentagsToggleTrace
" {only available when gutentags_define_advanced_commands is set}

Plugin 'ludovicchabant/vim-gutentags'

" Handles switching between cscope databases automatically before performing a
" search query
"
" Additional plugin for gutentags to handle switching databases automatically
" before performing a query (cscope vs ctags)
" NOTE: To use gtags-cscope run `apt install global`
" To check whether you use cscope or gtags-cscope run `:set csprg`

Plugin 'skywind3000/gutentags_plus'

" If you use cscope as well as ctags, |:cstag| allows you to search one or the
" other before making a jump.  For example, you can choose to first search
" your cscope database(s) for a match, and if one is not found, then your tags
" file(s) will be searched.  The order in which this happens is determined by
" the value of |csto|.  See |cscope-options| for more details.

set csto=0

" All of your Plugins must be added before the following line

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim plugins configuration section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Gutentags
""""""""""""""""""""""""""""""

" Automatically add the generated code database to Vim by running `:cs add`

let g:gutentags_auto_add_cscope=1

" To debug vim-gutentags, uncomment below line and run :message
" See also `g:gutentags_cscope_executable`, `g:gutentags_cscope_build_inverted_index`

let g:gutentags_trace=1

" Add support for cscope or gtags_cscope (by default only 'ctags')

let g:gutentags_modules=['ctags', 'cscope']
"let g:gutentags_modules=['ctags', 'gtags_cscope']

" See :help gutentag to learn more (below lines copied from there)

set statusline+=%{gutentags#statusline()}

" Permanently display path of the current file
"
" See: https://stackoverflow.com/questions/10488717/how-can-i-permanently-display-the-path-of-the-current-file-in-vim
"
"set statusline+=%F

" Because Gutentags runs the tag generation in the background, the statusline
" indicator might stay there even after the background process has ended. It
" would only go away when Vim decides to refresh the statusline. You can force
" refresh it in a callback on |GutentagsUpdating| and |GutentagsUpdated|.

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call airline#update_statusline()
    autocmd User GutentagsUpdated call airline#update_statusline()
augroup END

"augroup MyGutentagsStatusLineRefresher
"    autocmd!
"    autocmd User GutentagsUpdating call lightline#update()
"    autocmd User GutentagsUpdated call lightline#update()
"augroup END

"set cscopeprg='cscope'
set cscopeprg='gtags-cscope'

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

" Close documentation after insertion/completion

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

" Don't notify every time about loading .ycm_extra_conf.py (potentially insecure)
" See: https://github.com/ycm-core/YouCompleteMe/issues/1918

let g:ycm_confirm_extra_conf=0

""""""""""""""""""""""""""""""
" Tagbar config
""""""""""""""""""""""""""""""

nmap <F8> :TagbarToggle<CR>

" Always open Tagbar on startup

autocmd VimEnter * nested :TagbarOpen

""""""""""""""""""""""""""""""
" Cscope Auto
""""""""""""""""""""""""""""""

let g:cscope_auto_database_name = '.cscope'

""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""

" Set colors assuming light terminal background
"
" TODO is it possible for neovim to automatically figure it out?

set background=light

" Set lines numbers

set number

" Enable mouse

set mouse=a

" Show trailing whitespaces
" See:
" - https://stackoverflow.com/a/4617156/1321680
" - https://vim.fandom.com/wiki/Highlight_unwanted_spaces#Highlighting_with_the_match_command

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Set red column to indicate 80 characters width

set colorcolumn=80

" Navigate thorugh tabs using CTRL + L (next) and CTRL + H (previous)

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Easy exit from :terminal

tnoremap <Esc> <C-\><C-n>

" Save file shortcut '\' + 's'

noremap <Leader>s :update<CR>

" Remove all trailing whitespace by pressing F5

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Switch tab using CTRL + LEFT/RIGHT

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Display whitespaces
" See: https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character

set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" Toggle displaying whitespaces

noremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>
cnoremap <F4> <C-c>:set list!<CR>

" Copy current line (\ + *)

nnoremap <leader>* 0y$/\V<c-r>"<cr>

" Autoreload file as soon as it changes on disk

set autoread
