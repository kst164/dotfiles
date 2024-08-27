" Initial template from "http://vim.wikia.com/wiki/Example_vimrc"

set ignorecase
set smartcase
set nostartofline
set ruler
set confirm
set visualbell
set t_vb=

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
"------------------------------------------------------------
" End of online vimrc, start of mine


let mapleader=","

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
else
  set signcolumn=yes
endif

set termguicolors

" PLUGIN SETTINGS - BEFORE

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {
\  'rust': ['analyzer', 'cargo'],
\  'markdown': ['pandoc']
\}
let g:ale_fixers = {
\  'rust': ['rustfmt'],
\  'cpp': ['clang-format'],
\  'c': ['clang-format'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier'],
\  'typescriptreact': ['eslint', 'prettier'],
\  'html': ['prettier'],
\  'markdown': ['pandoc']
\}

let g:ale_c_clangformat_style_option = '{ BasedOnStyle: LLVM, IndentWidth: 4 }'
let g:ale_python_flake8_options = '--max-line-length=120'

" polyglot
let g:polyglot_disabled = ['c']

" lightline
set noshowmode

"------------------------------------------------------------
" vim-plug
call plug#begin()
    " vim usage things
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'preservim/nerdcommenter'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/rainbow_parentheses.vim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " dev things
    "Plug 'dense-analysis/ale'
    Plug 'rust-lang/rust.vim'
    Plug 'sevko/vim-nand2tetris-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'github/copilot.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'rvmelkonian/move.vim'

    " misc
    Plug 'vimwiki/vimwiki'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'junegunn/vim-emoji'

    " Colorschemes
    Plug 'tomasr/molokai'
    Plug 'ghifarit53/tokyonight-vim'
call plug#end()

"------------------------------------------------------------
" PLUGIN SETTINGS - AFTER


" NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" molokai
colorscheme molokai

" Coc
nmap <leader>dr <Plug>(coc-rename)
nmap <leader>df <Plug>(coc-format)
vmap <leader>df <Plug>(coc-format-selected)
nmap <leader>dgd <Plug>(coc-definition)
nmap <leader>dca <Plug>(coc-codeaction-cursor)
vmap <leader>dca <Plug>(coc-codeaction-selected)

" ALE
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>ar :ALERename<CR>
nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>aca :ALECodeAction<CR>
let g:ale_disable_lsp = 1
"let g:ale_cursor_detail = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_close_preview_on_insert = 1

"------------------------------------------------------------

set scrolloff=10

" Folding (collapsing) lines
set foldmethod=indent   
set nofoldenable
set foldlevel=2
