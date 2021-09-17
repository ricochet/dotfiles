" automatic plugin installation
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
" https://github.com/junegunn/vim-plug#usage
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ryanoasis/vim-devicons'

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-webdevicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Colors
Plug 'altercation/vim-colors-solarized'

" Powerline clone
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" Languages
Plug 'tpope/vim-endwise'

" json
Plug 'leshill/vim-json'
" typescript
Plug 'leafgarland/typescript-vim'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" prettier save
nmap <Leader>mp <Plug>(Prettier)

Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim', { 'as': 'dracula' }

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(yarn bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Formatting
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'matze/vim-move'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree
" open a NERDTree automatically when vim starts up?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Ctrl+n open NerdTree
map <C-n> :NERDTreeToggle<CR>

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" Status Line
" if this gives me trouble, going to jump to https://github.com/powerline/powerline
let g:airline_theme='simple'

" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" two spaces for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
