:set number
:set t_Co=256
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set belloff=all
set autoread 
au CursorHold * checktime       


call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/danilo-augusto/vim-afterglow' " Afterglow colorscheme
Plug 'https://github.com/neoclide/coc.nvim' " Autocompletion
Plug 'OmniSharp/omnisharp-vim'
Plug 'https://github.com/Valloric/MatchTagAlways'
Plug 'https://github.com/jiangmiao/auto-pairs'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/ervandew/supertab'
" Terminal In VIM
Plug 'voldikss/vim-floaterm'
" Vimtex setup
Plug 'https://github.com/lervag/vimtex'
"Better c-sharp syntax highlighting
Plug 'https://github.com/OrangeT/vim-csharp'
" Neomake
Plug 'https://github.com/neomake/neomake'
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

colorscheme afterglow

set bg=dark

syntax on

nnoremap <silent>fu :OmniSharpFindUsages<CR>
nnoremap <silent>cf : OmniSharpCodeFormat<CR>
nnoremap <silent>gd :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
nnoremap <silent>vwd :OmniSharpDocumentation
nnoremap <silent>rn : OmniSharpRename
nnoremap <C-o><C-r> :!dotnet run

" BG color for terminal
highlight Normal ctermbg=16

"Floaterm shortcuts
nmap <silent>ftn :FloatermNew

" FZF shortcuts
nmap <silent>fzf :FZF<CR>

"VimTex configuration
filetype plugin indent on

syntax enable

let g:vimtex_view_method= 'zathura'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf/#src:line@tex'

let g:vimtex_compiler_method = 'latexrun'

let maplocalleader = ','

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['mcs', 'code_checker']

" Neomake Config
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
" Open list window with errors automatically
let g:neomake_open_list = 2
