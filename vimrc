call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
setlocal laststatus=2
filetype plugin on

" http://www.vim.org/scripts/script.php?script_id=1319
" au BufRead,BufNewFile *.t set filetype=perl | compiler perlprove
" http://www.vim.org/scripts/script.php?script_id=56
" au BufRead,BufNewFile *.p(l|m)  set filetype=perl | compiler perl

" au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
" au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" # Derived from Appendix C of Perl Best Practices
" # See: http://www.oreilly.com/pub/a/oreilly/ask_tim/2001/codepolicy.html  
autocmd FileType perl set autoindent    	" Preserve current indent on new lines
autocmd FileType perl set textwidth=78          " Wrap at this column
set backspace=indent,eol,start    		" Make backspaces delete sensibly
autocmd FileType perl set matchpairs+=<:>       " Allow % to bounce between angles too

" Suggestions from the PerlMonks http://www.perlmonks.org/?node_id=146388
set vb " use visual bell instead of beeping
set incsearch " incremental search

autocmd FileType perl set autoindent|set smartindent " autoindent
set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4 " 4 space tabs
autocmd FileType perl set showmatch " show matching brackets
set number 

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

set nocompatible

