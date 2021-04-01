"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default colorscheme
set t_Co=256
set background=dark
syntax on
colorscheme ir_black

" Show line numbers
set number

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings and macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows-Style cut and paste
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
imap <C-V>   	"+gP
imap <S-Insert>  	"+gP

imap <C-V>  	<C-R>+
imap <S-Insert> 	<C-R>+

let mapleader = ","

" Enable omnicompletion
set ofu=syntaxcomplete#Complete

" Default distance parameter for ctrl+d and ctrl+u
set scroll=6

set viminfo='100,f1
filetype plugin on

" the ‘;’ at end will make vim tags file search go up until it finds one
set tags=tags;

" Map F8 to toggle the tag list window, default on
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0

" Map Shift+Tab to the escape key
inoremap <S-Tab> <Esc>

" hilight trailing whitespace in ugly TODO style
" match Todo /\s\+$/

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

" Swap split windows with mapped 'mw' and 'pw' commands
function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set shiftwidth=4
"set smartindent
set softtabstop=4
set expandtab
set backspace=2 " Sometimes vim doesn't like to let you delete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile
