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

" Syntax checking plugin for Vim created by Martin Grenfell. It runs files
" through external syntax checkers and displays any resulting errors to the
" user. This can be done on demand, or automatically as files are saved.
"
"Plugin 'vim-syntastic/syntastic'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim

Plugin 'ctrlpvim/ctrlp.vim'

" Class outline viewer for Vim (press F8 to activate)

Plugin 'majutsushi/tagbar'

" Deoplete: dark powered asynchronous completion framework for neovim/Vim8
"
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Adds snippet support to Vim

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Keybinding for snippets.
" As suggested here: https://stackoverflow.com/a/22253548/1321680
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

" Vim plug for switching between companion source files (e.g. ".h" and ".cpp")

Plugin 'derekwyatt/vim-fswitch'

" Seamless navigation between tmux panes and vim splits
"
"Plugin 'christoomey/vim-tmux-navigator'

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

" To debug vim-gutentags, uncomment below lines and run :message
" See also `g:gutentags_cscope_executable`, `g:gutentags_cscope_build_inverted_index`

let g:gutentags_define_advanced_commands=1
let g:gutentags_trace=1

" Add support for cscope or gtags_cscope (by default only 'ctags')

"let g:gutentags_modules=['cscope']  # TODO
"let g:gutentags_modules=['ctags', 'cscope']
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

set cscopeprg='cscope'
"set cscopeprg='gtags-cscope'

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

" Splitting a window will put the new window right of the current one

set splitright

" When on, splitting a window will put the new window below the current one

set splitbelow

" Don't close NERDTree after opening a file

let g:NERDTreeQuitOnOpen=0
let NERDTreeQuitOnOpen=0

" Synchronize NERDTree selected file with current buffer
" See: https://superuser.com/a/474298/139893

" calls NERDTreeFind iff NERDTree is active, current window contains a
" modifiable file, and we're not in vimdiff
function! s:syncTree()
  let s:curwnum = winnr()
  NERDTreeFind
  exec s:curwnum . "wincmd w"
endfunction

function! s:syncTreeIf()
  if (winnr("$") > 1)
    call s:syncTree()
  endif
endfunction

" Shows NERDTree on start and synchronizes the tree with opened file when
" switching between opened windows.

autocmd BufEnter * call s:syncTreeIf()

""""""""""""""""""""""""""""""
" YouCompleteMe config
""""""""""""""""""""""""""""""

let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_filepath_completion_use_working_dir=0

" Close documentation after insertion/completion

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

" Don't notify every time about loading .ycm_extra_conf.py (potentially insecure)
" See: https://github.com/ycm-core/YouCompleteMe/issues/1918

let g:ycm_confirm_extra_conf=0

" Keys mapping

nnoremap <C-c>g :YcmCompleter GoTo<CR>
nnoremap <C-c>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-c>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <C-c>gf :YcmCompleter GoToDefinition<CR>
nnoremap <C-c>t :YcmCompleter GetType<CR>
nnoremap <C-c>d :YcmCompleter GetDoc<CR>
nnoremap <C-c>fi :YcmCompleter FixIt<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>

""""""""""""""""""""""""""""""
" ALE config
""""""""""""""""""""""""""""""

"let g:ale_completion_enabled=1

nnoremap <C-c>r :ALEFindReferences<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""""""""""""""""""""""""""""""
" Tagbar config
""""""""""""""""""""""""""""""

nmap <F8> :TagbarToggle<CR>

" Always open Tagbar on startup

autocmd VimEnter * nested :TagbarOpen

""""""""""""""""""""""""""""""
" Cscope Auto
""""""""""""""""""""""""""""""

"let g:cscope_auto_database_name='.cscope'

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>a
	\:vert scs find a <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""

" Theme of the airline

let g:airline_theme='ayu_dark'

" Airline integration with ALE

let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""

" Set colors assuming light terminal background
"
" TODO is it possible for neovim to automatically figure it out?

set background=light

" Set line and line number highlights

set cursorline
hi CursorLine cterm=NONE ctermbg=255 ctermfg=NONE
hi CursorLineNR cterm=bold ctermfg=88

" Set colors for vimdiff

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Set lines numbers - relative on active buffer and absolute on inactive ones
" See: https://jeffkreeftmeijer.com/vim-number/

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

" Switch tab using CTRL + LEFT/RIGHT

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

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

" Copy current line (\ + *) into " register

nnoremap <leader>* 0y$/\V<c-r>"<cr>

" Autoreload file as soon as it changes on disk

set autoread
