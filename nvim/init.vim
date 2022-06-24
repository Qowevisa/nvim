" import vimrc
source ~/.vimrc

" LSP autocompletion
let g:coq_settings = { 'auto_start': v:true }

call plug#begin()

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

Plug 'f-person/git-blame.nvim'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'https://github.com/rafi/awesome-vim-colorschemes'

Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'shaeinst/roshnivim-cs'

"" coq_nvim

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc
"
" coq_end

call plug#end()

" Russian remaps
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
inoremap ъъ <ESC>

" airline settings
let g:airline#extensions#tabline#enabled = 1

syntax enable

" schemes I like
colorscheme purify
" colorscheme sierra
" colorscheme space-vim-dark
" colorscheme stellarized
" colorscheme tender
" colorscheme rvcs


" remaps
vnoremap <C-C> "+y
function! OpenNewCTab() range
    let scr_name = execute "normal! `<v`>y"
    execute ":tabedit " . src_name
    " \!normal `<v`>y<CR>\!normal `yw./inc/`<v`>y`!insert <BS><BS>.h<CR>"
endfunction
vnoremap ct :call OpenNewCTab()<CR>
inoremap jj <ESC>
nnoremap <C-S> :w<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <A-Left> :-tabmove<CR>
nnoremap <A-Right> :+tabmove<CR>
nnoremap h<C-H> :noh<CR>
nnoremap tn :tabnew<CR>

" C remaps
autocmd FileType c nnoremap <buffer> yw vl16<:edit 
autocmd FileType c inoremap <buffer> jj <ESC>

" C++ remaps
autocmd FileType cpp nnoremap <buffer> yw vl16<:edit 


" lua integration
lua require('plugins')
lua require('init')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Cursor highlight
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
