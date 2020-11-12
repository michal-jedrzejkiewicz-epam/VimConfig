" My custom .vimrc 
" Works perfectly on NeoVim
" 
" Installation:
" 1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. sudo apt install bat  -> bat is needed for fzf preview higlighting
" 3. export BAT_THEME="apprentice"
" 4. cp THIS_FILE ~

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" MY PLUGINS {{{
"https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

"https://github.com/osyo-manga/vim-brightest
Plugin 'osyo-manga/vim-brightest'

"https://github.com/mhinz/vim-signify
Plugin 'mhinz/vim-signify'

"https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'

"https://github.com/rhysd/clever-f.vim
Plugin 'rhysd/clever-f.vim'

"https://github.com/sickill/vim-pasta
Plugin 'sickill/vim-pasta'

"https://github.com/machakann/vim-highlightedyank
Plugin 'machakann/vim-highlightedyank'

"Plugin 'justincampbell/vim-eighties'
"Plugin 'takac/vim-hardtime'
" }}}
"
call vundle#end()              " Close Plugin block
filetype plugin indent on      " Automatically finds and load specific plugin

syntax on                      " Syntax coloring
syntax sync minlines=256       " Minimum number of lines to search backward for syntax tips

colorscheme apprentice         " Color scheme name

" SETS {{{
"
set t_Co=256                   " Set 256 colors
set spelllang=en_us            " Source spell checking definitions if available
set dictionary=dict            " List of file names, separated by commas, that are used to lookup words for keyword completion commands i_CTRL-X_CTRL-K.

set shortmess=a                " Reduce lenght of "Hit ENTER to continue" prompt messages
set showcmd                    " Display incomplete commands
set wildmenu                   " Command-line completion operates in an enhanced mode.
set wildmode=longest,list,full " Completion mode that is used for the character specified with 'wildchar'.
set visualbell                 " Use visual bell instead of beeping.

set cursorcolumn               " Highlight the column where the cursor is currently present
set cursorline                 " Highlight the line where the cursor is currently present
set ruler                      " Show the cursor position all the time
set number                     " Precede each line with its line number.
set relativenumber             " Show the line number relative to the line with the cursor in front of each line.
set scrolloff=5                " Determine the minimum number of context line visible above and below the curosr

set autoindent                 " Copy indent from current line when starting a new line.
set smartindent                " Automatically inserts one extra level of indent
set shiftwidth=4               " Control how many columns text is indented with
set tabstop=4                  " How many columns a tab counts for
set wrap                       " Wrap lines longer than the windows width.
"set foldenable                 " Enable folding
"set foldmethod=indent          " Fold based on indent level
set tabpagemax=100             " Change maximum number of tabs
set expandtab                  " Replace tabs with spaces
set backspace=indent,eol,start " Allow proper backspacing over special symbols.

set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2                " Tenths of a second to show the matching bracket.

set hidden                     " Allow buffer switching without saving/wirte
set clipboard+=unnamedplus     " Everything  yanked in vim will go to the unnamed register, and vice versa.
set undolevels=9999999         " Maximum number of changes that can be undone.
set history=2000               " Keep 50 lines of command line history

set title                      " When on, the title of the window will be set to the value of 'titlestring'.
set laststatus=2               " Always show status line

set hlsearch                   " Highlight searched text
set incsearch                  " Do incremental searching

set ignorecase                 " The case of normal letters is ignored.
set smartcase                  " Override the 'ignorecase' option if the search pattern contains upper case characters.


set nobackup                   " Doesn't make a backup before overwriting a file.
set noswapfile                 " Disables creating swap files.
set sessionoptions-=options    " Changes the effect of the :mksession command.

set splitbelow                 " Open new split panes to bottom, instead top
set splitright                 " Open new split panes to right, instead of left
set autoread                   " Auto reload if file saved externally
                               " Set list to show spaces 
set colorcolumn=130            " Set color on specific column

set ff=unix                    " Set unix line endings 
set makeprg=make\ -C\ ../build\ -j9

" }}}

" maps {{{

"change  to ,"
let mapleader=','

"move through splits"
"map<C-j> <C-W>j
"map<C-k> <C-W>k
"map<C-h> <C-W>h
"map<C-l> <C-W>l
"
" jk | Escaping!
"xnoremap jk <Esc>
"cnoremap jk <C-c>
"inoremap jk <Esc>
"inoremap kj <esc>

" Readline-style key bindings in command-line (excerpt from rsi.vim)
"cnoremap        <C-A> <Home>
"cnoremap        <C-B> <Left>
"cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
"cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

"open vimrc
map vv <Esc>:tabe $MYVIMRC<CR>

"space in normal mode
nnoremap <space> i<space><esc>

"tags open in vertical split
"map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz
"map <C-]> <C-]>zz

"move line in visual
vnoremap < <gv
vnoremap > >gv

"quit file
"nnoremap qq :q<cr>

"copy from cursor to end line
noremap Y y$

"save file
map <leader>w :w<cr>

"4.6.0_64     " }}}


" undo files {{{
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
" }}}

" hardtime {{{
"let g:hardtime_ignore_buffer_patterns = ["init.vim"]
"let g:hardtime_default_on = 1
"let g:hardtime_ignore_quickfix = 1
"let g:hardtime_maxcount = 0
" }}}

" fzf {{{
map <C-p> :Files<cr>

"grep
"map <leader>ag :Ag <c-r><c-w><cr>

let g:fzf_files_options =
			\ '--preview "/opt/python-pygments/noarch/2.2.0.p360-1/bin/pygmentize {}"'

" ag with preview
"command! -bang -nargs=* Ag
"		\ call fzf#vim#ag(<q-args>, ' --color-path 400 --color-line-number 400',
"		\                 <bang>0 ? fzf#vim#with_preview('up:60%')
"		\                         : fzf#vim#with_preview('right:50%:wrap', '?'),
"		\                 <bang>0)

" fzf colors like colorscheme
function! s:update_fzf_colors()
    let rules =
                \ { 'fg':      [['Normal',       'fg']],
                \ 'bg':      [['Normal',       'bg']],
                \ 'hl':      [['Comment',      'fg']],
                \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
                \ 'bg+':     [['CursorColumn', 'bg']],
                \ 'hl+':     [['Statement',    'fg']],
                \ 'info':    [['PreProc',      'fg']],
                \ 'prompt':  [['Conditional',  'fg']],
                \ 'pointer': [['Exception',    'fg']],
                \ 'marker':  [['Keyword',      'fg']],
                \ 'spinner': [['Label',        'fg']],
                \ 'header':  [['Comment',      'fg']] }
    let cols = []
    for [name, pairs] in items(rules)
        for pair in pairs
            let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
            if !empty(name) && code != ''
                call add(cols, name.':'.code)
                break
            endif
        endfor
    endfor
    let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
    let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
                \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
    autocmd!
    autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
augroup END


" }}}

" Easy Motion {{{

" maping easy search and easy motion
nmap s <Plug>(easymotion-overwin-f2)
"let g:EasyMotion_skipfoldedline = 0
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-bd-jk)
map <Leader>k <Plug>(easymotion-k)
" map  z/ <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
" colors
hi EasyMotionTarget ctermfg=1 cterm=bold,underline
hi link EasyMotionTarget2First EasyMotionTarget
hi EasyMotionTarget2Second ctermfg=1 cterm=underline

" }}}

" yank highlight {{{
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 1200
" }}}

" eighties {{{
"let g:eighties_enabled = 1
"let g:eighties_minimum_width = 120
"let g:eighties_extra_width = 0 " Increase this if you want some extra room
"let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
"let g:eighties_bufname_additional_patterns = ['fugitiveblame']
" }}}

" remember the line I was on when I reopen a file
autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ exe "normal! g`\"" |



let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

map     <F2> <C-]>
map     <F3> <C-T>
"map     <F4><CR>

"map     <F5> :split<CR>
map     <F6> :vsplit<CR>
"map     <F7> :only<CR>
"map     <F8> <CR>

map     <F9> :set wrap!<CR>
map     <F10> :call ToggleMouse()<CR>
map     <F11> :e %:h<CR>
map     <F12> :tabe %:h<CR>

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
