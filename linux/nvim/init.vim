"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"plugins here, coc for example
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
"Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'diepm/vim-rest-console'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'puremourning/vimspector'
Plug 'tomasiser/vim-code-dark'
Plug 'HerringtonDarkholme/yats'
call plug#end()



"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

set mouse=a
set nocompatible
set completeopt=longest,menuone,noinsert,noselect
set splitright
set splitbelow
set expandtab
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set number				" Turn on line numbers
set diffopt+=vertical
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch
set hlsearch
set hidden
set noswapfile
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set laststatus=2                  " Show the status line all the time
set noshowmode                    " Don't show --Insert-- below statusbar cause not necessary
" Die letzten 100 Befehle in der history behalten
set history=100
set cursorline
set termguicolors                 " Enables 24-bit RGB color
set updatetime=400
   
" kopiert yank (y) in die Zwischenablage, Mac OS: set clipboard=unnamed 
set clipboard=unnamedplus 

set background=dark
colorscheme codedark " kuroi morning wombat256grf slate torte desert
set gfn=Menlo\ Regular:h13

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" set foldmethod=indent
" Note: set re=0 explicitly in your vimrc. Old regexp engine will incur performance issues for yats and old engine is usually turned on by other plugins.
set re=0


let mapleader=" "    " set leader to space

let g:neoformat_try_formatprg = 1

let g:netrw_banner=0
let g:markdown_fenced_languages=['javascript', 'js=javascript', 'json=javascript']

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

      " Alternative to show gitbranch name via plugin vim-gitbranch
      "\ 'component_function': {
      "\   'gitbranch': 'gitbranch#name'
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'FugitiveHead'
      "\ },
"---------------------------- KEY MAPPINGS---------------------
" for completion popup
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" ,, reloads ~/.config/nvim/init.vim
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>
" ,v loads ~/.config/nvim/init.vim into a new buffer
nnoremap <silent> <Leader>v :e $MYVIMRC<cr>

" leader x closes buffer
nnoremap <leader>x :bd<cr>

" toggle display extra whitespaces
map <Leader>lc :set list! listchars=tab:»·,trail:·,eol:$,nbsp:·<CR>

" because <C-]> on german keyboard is a impossible mission
nnoremap Ö <C-]>
nnoremap ö <]>
nnoremap ä <[>

" toggle line wrapping ",w"
nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>
" toggle search result highlighting ",n"
" nmap <silen-- <Leader>n :set invhls<CR>:set hls?<CR>
nmap <silent> <Leader>n :nohlsearch<CR>

" resize a vertical split window
map <leader>+ :vertical resize +5<CR>
map <leader>- :vertical resize -5<CR>

" press ,b to open buffer list and select a buffer by name or number
nnoremap <Leader>b :Buffers <CR>
nnoremap <Leader>h :History<CR>

" format an xml with ,xf
" xml indention
map <Leader>xi mx<Esc>:%s/></>\r</g<CR>gg=G<Esc>'x<Esc>
map <Leader>xf <Esc>:%s/></>\r</g<CR>:set ft=xml<CR><ESC>gg=G
map <Leader>htmli <Esc>:%s/></>\r</g<CR>:set ft=html<CR><ESC>gg=G
" json formatting and indention
map <Leader>jf  <Esc>:%!python -m json.tool<CR>

" szw/vim-maximizer
nnoremap <leader>m : MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 30
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <ESC>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR> 
nnoremap <leader>f :Prettier<CR>

" junngunn /fzf.vim
nnoremap <leader><space> :GFiles<CR>
nnoremap <c-p> :Files<CR>
nnoremap <leader>ff :Rg<CR>
" Search content in the current file
nmap <leader>l :BLines<cr>
nmap <leader>tt :Tags<cr>
nmap <leader>tb :BTags<cr>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
  \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
  \ fzf#wrap({'dir': expand('%:p:h')}))
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif
nnoremap <leader>co :Commits<CR>

" tpope/vim-fugitive
nnoremap <leader>gg :G<cr>
nnoremap <leader>gd :Gdiff master<cr>
nnoremap <leader>gl :G log -100<cr>

" neovim/nvim-lspconfig
"lua require'lspconfig'.tsserver.setup{}
"lua << EOF
"local lspconfig = require'lspconfig'
  "lspconfig.rust_analyzer.setup({
      "settings = {
          "["rust-analyzer"] = {
              "assist = {
                  "importMergeBehavior = "last",
                  "importPrefix = "by_self",
              "},
              "cargo = {
                  "loadOutDirsFromCheck = true
              "},
              "procMacro = {
                  "enable = true
              "},
          "}
      "}
  "})
"EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>


" puremourning/vimspector
 fun! GotoWindow(id)
   :call win_gotoid(a:id)
 endfun
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
 let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
 let g:vimspector_sidebar_width = 60
 " https://github.com/puremourning/vimspector#visual-studio--vscode
 let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
 " for normal mode - the word under the cursor
 nmap <Leader>di <Plug>VimspectorBalloonEval
 " for visual mode, the visually selected text
 xmap <Leader>di <Plug>VimspectorBalloonEval
 nmap <S-F5> <Plug>VimspectorReset 
 "nnoremap <leader>da :call vimspector#Launch()<CR>
 "nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 "nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 "nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 "nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 "nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
 "nnoremap <leader>di :call AddToWatch()<CR>
 "nnoremap <leader>dx :call vimspector#Reset()<CR>
 "nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 "nnoremap <S-k> :call vimspector#StepOut()<CR>
 "nnoremap <S-l> :call vimspector#StepInto()<CR>
 "nnoremap <S-j> :call vimspector#StepOver()<CR>
 "nnoremap <leader>d_ :call vimspector#Restart()<CR>
 "nnoremap <leader>dn :call vimspector#Continue()<CR>
 "nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
 "nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
 "nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
 let g:vimspector_sign_priority = {
   \    'vimspectorBP':         998,
   \    'vimspectorBPCond':     997,
   \    'vimspectorBPDisabled': 996,
   \    'vimspectorPC':         999,
   \ }

"------------------------------------------------------------------------------------------------------------------
" coc.vim configuration START
"------------------------------------------------------------------------------------------------------------------
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Coc-Prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile
:nnoremap <leader>e :CocCommand explorer<CR>

" Coc-Highlight config
autocmd CursorHold * silent call CocActionAsync('highlight')

" use some shortcuts to jump to definition and implementation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>dgn <Plug>(coc-diagnostic-next-error)
"------------------------------------------------------------------------------------------------------------------
" coc.vim configuration END
"------------------------------------------------------------------------------------------------------------------
