set nocompatible

colorscheme kreuzberg "desert
set gfn=Menlo\ Regular:h13
set nu				" Turn on line numbers

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set noswapfile
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
"set expandtab                     " Use spaces instead of tabs
set noexpandtab

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set incsearch
set hlsearch

" Die letzten 100 Befehle in der history behalten
set history=100

" = keyboard mappings =

let mapleader=","    " set leader to ','

" toggle display extra whitespaces
map <Leader>lc :set list! listchars=tab:»·,trail:·,eol:$,nbsp:·<CR>

" because <C-]> on german keyboard is a impossible mission
nnoremap ü <C-]>

" toggle line wrapping ",w"
nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>
" toggle search result highlighting ",n"
" nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>
nmap <silent> <Leader>n :nohlsearch<CR>

" edit vim configuration ",vr"
map <Leader>vr :e $MYVIMRC<CR>
au! BufWritePost $MYVIMRC source $MYVIMRC "  source vimrc after each write
map <Leader>gr :e $MYGVIMRC<CR>

"make Y consistent with C and D
nnoremap Y y$

" switch to the last buffer used ",,"
map <leader><leader> <C-^>
" tab through buffers
map <Tab> :bn<CR>

" insert an empty line outside of insert-mode "shift-enter"
map <S-Enter> O<Esc>

" indent file (and delete trailing whitespaces)
map <silent> <Leader>i :%s/\s\+$//e<Esc>mx<Esc>gg=G<Esc>'x<ESC>
" xml indention
map <Leader>xi mx<Esc>:%s/></>\r</g<CR>gg=G<Esc>'x<Esc>
map <Leader>xmli <Esc>:%s/></>\r</g<CR>:set ft=xml<CR><ESC>gg=G
map <Leader>htmli <Esc>:%s/></>\r</g<CR>:set ft=html<CR><ESC>gg=G

" json formatting and indention
map <Leader>jf  <Esc>:%!python -m json.tool<CR>
command! W :w " wurstfinger fix: :W == :w
" emacs movement keybindings in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

"map <Leader>f :set fu<CR>:set co=999<CR>:set lines=999<CR>

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
"autocmd BufNewFile,BufRead *_spec.rb compiler rspec

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()

function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" unaggressive folding text
"function! MyFoldText()
"  let line = getline(v:foldstart)
"  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
"    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
"    let linenum = v:foldstart + 1
"    while linenum < v:foldend
"      let line = getline( linenum )
"      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
"      if comment_content != ''
"        break
"      endif
"      let linenum = linenum + 1
"    endwhile
"    let sub = initial . ' ' . comment_content
"  else
"    let sub = line
"    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
"    if startbrace == '{'
"      let line = getline(v:foldend)
"      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
"      if endbrace == '}'
"        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
"      endif
"    endif
"  endif
"  let n = v:foldend - v:foldstart + 1
"  let info = " " . n . " lines"
"  let sub = sub . "                                                                                                                  "
"  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
"  let fold_w = getwinvar( 0, '&foldcolumn' )
"  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
"  return sub . info
"endfunction

"if &term =~ "xterm"
  let &t_SI = "\<Esc>]12;purple\x7"
  let &t_EI = "\<Esc>]12;blue\x7"
"endif

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen
"au FileType javascript setl nocindent
"
"au FileType javascript imap <c-t> AJS.log();<esc>hi
"au FileType javascript imap <c-a> alert();<esc>hi
"
"au FileType javascript inoremap <buffer> $r return
"au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
"
"function! JavaScriptFold()
"    setl foldmethod=syntax
"    setl foldlevelstart=1
"    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"    function! FoldText()
"    return substitute(getline(v:foldstart), '{.*', '{...}', '')
"    endfunction
"    setl foldtext=FoldText()
"endfunction

"""""""""""""""""""""""""""""""
" ==> Hex-Darstellung
" der hex-modus kann über das hex plugin
" auch mittels <leader>hm eingeschaltet werden
" s.: http://www.vim.org/scripts/script.php?script_id=666
"""""""""""""""""""""""""""""""
map <leader>hex :%!xxd<CR>      " einschalten
map <leader>nhex :%!xxd -r<CR>  " ausschalten

"Markdown to HTML  
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>  

" kopiert yank (y) in die Zwischenablage, Mac OS: set clipboard=unnamed 
set clipboard=unnamedplus 

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

