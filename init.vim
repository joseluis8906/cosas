call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'trevordmiller/nova-vim'
Plug 'magarcia/vim-angular2-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
call plug#end()

set nu nowrap tabstop=2 softtabstop=2 smartindent expandtab shiftwidth=2
colorscheme nova
set clipboard+=unnamedplus

setlocal omnifunc=syntaxcomplete#Complete


"##### leafgarland/typescript-vim #####
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"##### vim-syntastic/syntastic ######
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']


"##### Quramy/vim-js-pretty-template ######
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces
autocmd FileType html JsPreTmpl


"##### airblade/vim-gitgutter #####
"let g:gitgutter_highlight_lines = 1


"##### move lines #####
nnoremap <A-k> :m .+1<CR>==
nnoremap <A-i> :m .-2<CR>==
inoremap <A-k> <Esc>:m .+1<CR>==gi
inoremap <A-i> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '>+1<CR>gv=gv
vnoremap <A-i> :m '<-2<CR>gv=gv


"##### remap keys #####
nnoremap e i
nnoremap j h
nnoremap k j
nnoremap i k

nnoremap <C-j> <C-W><C-H>
nnoremap <C-k> <C-W><C-J>
nnoremap <C-i> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

let NERDTreeMapOpenSplit='v'
