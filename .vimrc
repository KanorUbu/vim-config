set encoding=utf8
set nocompatible  "Rend Vim non compatible avec Vi
set t_Co=256
"colorscheme xoria256
set shiftwidth=4  "Défini 4 espace comme taille d'indentation
set tabstop=4     "Défini 2 espace commet taille d'indentation
set softtabstop=4 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent
set expandtab     "Insère un nombre approprié d'espace pour <Tab>
set smarttab      "<Tab> en début de ligne, insère blancs selon shiftwidth sinon tabstop
set smartindent   "Indentation des mots de l'option 'cinwords'
"set autoindent   "Indentation comme la ligne précédente
set backspace=indent,eol,start "Retour Arrière autorisé en mode Insertion pour suppression
set ruler         "Affiche en bas à droite la position du curseur
set showcmd       "Affiche en bas à droite la commande en cours de saisie
set showmode      "Affiche en bas à droite le mode actif
set showmatch     "Affiche automatiquement la parenthèse correspondante
set wrap          "Si ligne trop longue se poursuit sur ligne suivante
set incsearch     "Montre correspondance partielle du motif de recherche
set hlsearch      "Surligne les occurrences de la chaîne recherchée
set ignorecase    "Ignore la casse dans les motifs de recherche
set mouse=a       "Permet au click de souris de modifier la position du curseur
set cursorline    "Soulignement de la ligne courante
highlight CursorLine guibg=grey    "Surligne la ligne courante en gris
set completeopt=menuone,longest,preview

set laststatus=2  " Affiche la barre d'état en plus de la barre de commande
" set statusline=%-Y%k%=%f%10p%%%10l/%L "Format de la barre d'état
set statusline=%-Y%k%=%f%10p%%%10l/%L "Format de la barre d'état
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


set wildmenu
" set wildmode=list:full " Affiche une liste lors de complétion de commandes/fichiers
set wildmode=list:longest " Affiche une liste lors de complétion de commandes/fichiers
set wildignore=*.pyc

set backup         " Activer la sauvegarde
set backupdir=$HOME/.vim/backup

"Vundle
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'laarmen/git-vim.git'
Bundle 'lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'altercation/vim-colors-solarized'
Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-surround"
Bundle "scrooloose/nerdtree.git"
Bundle "mhz/vim-matchit"
Bundle "tomtom/tcomment_vim"
Bundle "chrisbra/csv.vim"
Bundle "Bogdanp/pyrepl.vim"
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'taglist-plus'
Bundle "YankRing.vim"
Bundle "nvie/vim-rst-tables"
Bundle "jceb/vim-orgmode"
Bundle "utl.vim"
Bundle "wincent/Command-T"
Bundle "Lokaltog/vim-powerline"
Bundle "scrooloose/syntastic"
Bundle "sjl/gundo.vim"
noremap <silent> <F11> :YRShow<CR>

" ...

filetype plugin indent on     " required!
"End vundle

"Zenburn
Bundle 'Zenburn'
" colorscheme zenburn
colorscheme peachpuff

"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'python'],
                           \ 'passive_filetypes': ['puppet'] }

"call togglebg#map("<F10>")
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256

"PowerLine
let Powerline_symbols = 'fancy'



noremap <C-K> <C-U>  " Déplace 1/2 écran vers le haut
noremap <C-J> <C-D>  " Déplace 1/2 écran vers le bas
map <tab> >>
map <S-tab> <
vmap <tab> >gv
vmap <S-tab> <gv
map <F2> :%s/  *$// <CR>
map <F5> :set paste!<Bar>set paste?<CR>
map <F6> :set number!<Bar>set number
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>
syntax on         "Activation de la coloration syntaxique
" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C><Tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nnoremap <C-f><C-f> :FufFile<CR>

"filetype plugin indent on  "Detection to determine the type of the current file

au BufRead *.stl so  $VIMRUNTIME/syntax/html.vim
au BufNewFile,BufRead *.rst so  $VIMRUNTIME/syntax/rst.vim
au BufNewFile,BufRead *.rst setlocal spell spelllang=fr
let g:languagetool_jar=$HOME . '/Program/LanguageTool/LanguageTool.jar'
"Completion Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
:au BufWinEnter *.py let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

autocmd filetype html        set omnifunc=htmlcomplete#CompleteTags
autocmd filetype css         set omnifunc=csscomplete#CompleteCSS
au filetype javascript  set omnifunc=javascriptcomplete#CompleteJS
au filetype c           set omnifunc=ccomplete#Complete
au filetype php         set omnifunc=phpcomplete#CompletePHP
au filetype ruby        set omnifunc=rubycomplete#Complete
au filetype sql         set omnifunc=sqlcomplete#Complete
au filetype xml         set omnifunc=xmlcomplete#CompleteTags

autocmd FileType html set shiftwidth=2  "Défini 4 espace comme taille d'indentation
autocmd FileType html set tabstop=2     "Défini 2 espace commet taille d'indentation
autocmd FileType html set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent

au FileType xml setlocal foldmethod=syntax
"Surligne les espaces de fin de ligne
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e

"Copier/coller avec la souris
function! Paste(...)
if (exists ("a:1"))
if a:1 == "on"
let b:fo = &formatoptions
let b:ai = &autoindent
let b:si = &smartindent
exe ':set formatoptions='
exe ':set noautoindent'
exe ':set nosmartindent'
echo "autoformatting disabled: you can safely mouse-paste"
elseif a:1 == "off"
exe ':set formatoptions='.b:fo
if b:ai == 1
exe ':set autoindent'
endif
if b:si == 1
exe ':set smartindent'
endif
echo 'autoformatting options restored'
endif
else
echo 'usage: :Paste on|off'
endif
endfunction
:com! -nargs=* Paste call Paste()
imap <C-Space> <C-X><C-O>
function MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s .= '%#TabLineSel#'
	    else
	      let s .= '%#TabLine#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s .= '%' . (i + 1) . 'T'

	    " the label is made by MyTabLabel()
	    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s .= '%=%#TabLine#%123Xclose'
	  endif

	  return s
endfunction


function! GG(args)
    execute 'tabnew'
    execute 'tabm'
    call GitGrep(a:args)
endfunction
command!   -nargs=*                                       GG  call GG(<q-args>)


" Grep du mot sous le curseur dans un nouvel onglet
function! GitGrepWordUnderCursor()
    execute 'tabnew'
    execute 'tabm'
    let a = @
    call GitGrep(a)
endfunction

python << EOF
import vim
import re
def clean_syntax():
    patterns = [
        {'regexp': ' *,',
         'replace': r','},
        {'regexp': ', *',
         'replace': r', '},
        {'regexp': ',([^ ])',
         'replace': r', \1'},
        {'regexp': ' *: *',
         'replace': r': '},
        {'regexp': ':([^ ])',
         'replace': r': \1'},
        {'regexp': '(\[|{|\() *',
         'replace': r'\1'},
        {'regexp': '([^ ]) *(\]|}|\))',
         'replace': r'\1\2'},
        {'regexp': ' *$',
         'replace': r''},
        ]
    r = vim.current.range
    b = vim.current.buffer
    for num_line in range(r.start, r.end+1):
        for pattern in patterns:
            b[num_line] = re.sub(
                pattern['regexp'],
                pattern['replace'],
                b[num_line])
EOF
map  <F6> :python clean_syntax()<CR><ESC>: echo '!!! Syntax cleaned !!!'<CR>


if !has("gui_running")
	" À défaut de pouvoir changer la forme du curseur
	" en fonction du mode de Vim, on peut changer sa couleur
	" en passant par des fonctions de contrôle.
	if &term =~ "rxvt-unicode"
		" From ECMA-48:
		"   OSC - OPERATING SYSTEM COMMAND:
		"     Representation: 09/13 or ESC 05/13 (this is \033] here)
		"     OSC is used as the opening delimiter of a control string for operating system use.
		"     The command string following may consist of a sequence of bit combinations
		"     in the range 00/08 to 00/13 and 02/00 to 07/14.
		"     The control string is closed by the terminating delimiter STRING TERMINATOR (ST).
		"     The interpretation of the command string depends on the relevant operating system.
		" From :h t_SI:
		"   Added by Vim (there are no standard codes for these):
		"     t_SI start insert mode (bar cursor shape)
		"     t_EI end insert mode (block cursor shape)
		let &t_SI = "\033]12;red\007"
		let &t_EI = "\033]12;green\007"

		:silent !echo -ne "\033]12;green\007"
		autocmd VimLeave * :silent :!echo -ne "\033]12;green\007"
	endif
	" screen rajoute une couche qu'il faut percer.
	if &term =~ "screen"
		" From man screen:
		"   Virtual Terminal -> Control Sequences:
		"     ESC P  (A)  Device Control String
		"                 Outputs a string directly to the host
		"                 terminal without interpretation.
		"     ESC \  (A)  String Terminator
		let &t_SI = "\033P\033]12;red\007\033\\"
		let &t_EI = "\033P\033]12;green\007\033\\"

		:silent !echo -ne "\033P\033]12;green\007\033\\"
		autocmd VimLeave * :silent :!echo -ne "\033P\033]12;green\007\033\\"
	endif
endif

if !has("gui_running")
	" La plupart des émulateurs de terminaux envoient Tab pour C-Tab,
	" aussi ai-je dans mon ~/.Xresources :
	" URxvt*keysym.C-Tab: \033[27;5;9~
	nmap <Esc>[27;5;9~ :tabprevious<CR>
endif
