if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

Plug 'rakr/vim-one'
" Plug 'dylanaraps/wal.vim'

call plug#end()

" GENERAL ----------------------------------------
set clipboard+=unnamedplus
filetype indent plugin on
let mapleader=" "
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set hlsearch
set laststatus=2
set mouse=a
set nobackup
set noexpandtab tabstop=4 shiftwidth=4
set noshowmode
set noswapfile
set nowrap
set nu rnu
set path+=**
set showcmd
set signcolumn=yes:2
set smartcase
set smartindent
set t_Co=256
set updatetime=50
set wildmenu
syntax on


" Enable autocompletion --------------------------
set wildmode=longest,list,full

" Disables automatic commenting on newline -------
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" open terminal in current directory
nnoremap <leader>t :silent !env xfce4-terminal --drop-down &<CR>

" Colorscheme -------------------------------------
colorscheme nord
" colorscheme wal
set background=dark
set termguicolors
" darker background


" STATUS BAR -------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'        " disable file paths in tabline
let g:airline#extensions#tabline#show_close_button = 0  " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tab_nr_type = 1        " tab number

" CTRLP configs
"let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \}
let g:ctrlp_working_path_mode = '0'

" BINDINGS ---------------------------------------

" Replace word under cursor ----------------------
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
vnoremap <leader>r "ry :%s/<C-R>=substitute(escape(@r, '/\'), "\n", '\\n', 'ge')<CR>/

" Toggle comments --------------------------------
map <C-\> <Plug>NERDCommenterToggle$

" Sweet Sweet FuGITive
nmap <leader>gq :diffget //3<CR>
nmap <leader>gp :diffget //2<CR>
nmap <leader>gs :G<CR>


" Correct indentation JSON files
nmap :json<CR> :%!python -m json.tool<CR>

" Vertical/Horizontal resize abbreviation
ca vr vertical resize
ca hr resize

map <leader>g{ :GitGutterNextHunk<CR>
map <leader>g} :GitGutterPrevHunk<CR>
map <leader>gu :GitGutterUndoHunk<CR>
map <leader>gh :GitGutterPreviewHunk<CR>

" Coc Bindings -----------------------------------
" Use <c-space> to trigger completion.

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>cr :CocRestartmap
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>gd     :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <leader>gD     <Plug>(coc-references)
nmap <leader>gi     :call CocActionAsync('jumpImplementation', 'tabe')<CR>
nmap <leader>gt     <Plug>(coc-type-definition)
nmap <leader>g[     <Plug>(coc-diagnostic-prev)
nmap <leader>g]     <Plug>(coc-diagnostic-next)
nmap <leader>rn     <Plug>(coc-rename)
nmap <leader>rs     <Plug>(coc-search)
xmap <leader><C-l>  <Plug>(coc-format-selected)
vmap <leader><C-l>  <Plug>(coc-format-selected)
nmap <leader><C-l>  <Plug>(coc-format-selected)
nmap <C-A-l>        <Plug>(coc-format)
nmap <leader>qf     <Plug>(coc-fix-current)
nmap <leader>ac     <Plug>(coc-codeaction)
xmap <leader>a      <Plug>(coc-codeaction-selected)
nmap <leader>a      <Plug>(coc-codeaction-selected)

" Tabs and Windows -------------------------------
nmap <silent> <C-T>1       :tabn 1<CR>
nmap <silent> <C-T>2       :tabn 2<CR>
nmap <silent> <C-T>3       :tabn 3<CR>
nmap <silent> <C-T>4       :tabn 4<CR>
nmap <silent> <C-T>5       :tabn 5<CR>
nmap <silent> <C-T>6       :tabn 6<CR>
nmap <silent> <C-T>7       :tabn 7<CR>
nmap <silent> <C-T>8       :tabn 8<CR>
nmap <silent> <C-T>9       :tabn 9<CR>
nmap <silent> <C-T>c       :tabnew<CR>
nmap <silent> <C-W>c       :tabnew<CR>
nmap <silent> <C-W>t       :tabnew<CR>
nmap <silent> <C-T>q       :tabclose<CR>
nmap <silent> <C-W>w       :Windows<CR>
nmap <silent> <A-Left>     :tabprev<CR>
nmap <silent> <A-Right>    :tabnext<CR>
nmap <silent> <C-A-Right>  :bnext<CR>
nmap <silent> <C-A-Left>   :bprevious<CR>
 "<C-W>T moves window to a new tab


" NERDTree ---------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Spellchecker -----------------------------------
map <F6> :setlocal spell! spelllang=en<CR>
map <F7> :setlocal spell! spelllang=sr@latin<CR>

" Ctrlp --------------------------------------------
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" fzf --------------------------------------------
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.85 } }
let $FZF_DEFAULT_OPTS='--reverse'
map <leader><leader> :Files<CR>
map <C-F> :Rg<CR>
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" compiler
"map <leader>c :w! \| !npile <c-r>%<CR>
"map <leader>m :w! \| silent !make<CR>


" Coc --------------------------------------------

" disable running coc at startup
 "let g:coc_start_at_startup = v:false


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
