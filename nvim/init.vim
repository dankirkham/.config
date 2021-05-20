set listchars=tab:▸·,trail:·
set list

set relativenumber
set number

set tabstop=2
set shiftwidth=2
set autoindent
set noexpandtab

set colorcolumn=80
set nowrap

set laststatus=2

set noswapfile
set nobackup

set ignorecase
set incsearch

set scrolloff=0

color slate

" Disable relative number when leaving a buffer
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

let g:rainbow_active = 1

" For lightline to show correct colors
if !has('gui_running')
  set t_Co=256
endif

" Keybinds
map <C-P> :Files<CR>

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"  Plug 'preservim/nerdtree'
"  Plug 'frazrepo/vim-rainbow'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"  Plug 'airblade/vim-gitgutter'
  Plug 'vim-syntastic/syntastic'
  Plug 'ycm-core/YouCompleteMe'
"  Plug 'overcache/NeoSolarized'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'vim-scripts/DoxygenToolkit.vim'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'tpope/vim-eunuch' " :Move files
  Plug 'majutsushi/tagbar'
  Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" Linter Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint'
" let g:syntastic_javascript_eslint_args = '--fix'
let g:syntastic_cpp_checkers = []
" let g:syntastic_cpp_clang_tidy_args = '-p build-debug/'
" let g:syntastic_cpp_clang_tidy_post_args = ""
" let g:syntastic_cpp_cpplint_exec = 'cpplint'

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_eslint_args =
    \ get(g:, 'syntastic_javascript_eslint_args', '') .
    \ FindConfig('-c', '.eslintrc.json', expand('<afile>:p:h', 1))

" Fix netrw copy
let g:netrw_keepdir=0

" JS scripts
function! ReplaceHasOwnProperty()
    let l = 1
    for line in getline(1, "$")
      call setline(l, substitute(line, '\.hasOwnProperty(\(.\{-}\))', '[\1]', 'g'))
      let l = l + 1
    endfor
endfunction

" Leader mappings
function! ExecuteLeader(suffix)
  let l:leader = get(g:,"mapleader","\\")

  if l:leader == ' '
    let l:leader = '1' . l:leader
  endif

  execute "normal ".l:leader.a:suffix
endfunction

command! -nargs=1 NormLead call ExecuteLeader(<f-args>)

let mapleader = " "

nnoremap <leader>\ :vsp<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>

nnoremap <leader>s :set et<CR>
nnoremap <leader>t :set noet<CR>

nnoremap <leader>2 :set sw=2 ts=2<CR>
nnoremap <leader>4 :set sw=4 ts=4<CR>

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

nnoremap <leader>u :noh<CR>

nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>

" Tab nav
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
nnoremap <c-t> :tabnew<CR>

" Jump to snippet
nnoremap <leader><Tab> /<--><CR>vf>s

" JS
autocmd FileType javascript nnoremap <leader>il oconst <--> = (<-->) => {<CR><--><CR>};<ESC>2k_/<--><CR>vf>s
autocmd FileType javascript nnoremap <leader>ic oconst <--> = ({<-->}) => {<CR>return (<CR><><CR><Tab><--><CR><\><CR>);<CR>};<ESC>2k_/<--><CR>vf>s

" C++
autocmd FileType cpp nnoremap <leader>d :Dox<CR>

" Protobuf
autocmd FileType proto nnoremap <leader>in mb?^message \w\+ \{-\}{<CR>jVk$%k:s/\d\{-\};/1;<CR>?^message \w\+ \{-\}{<CR>ma/1;<CR>jV'a$%kg<c-a>:noh<CR>'b
