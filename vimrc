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
"set incsearch     "Montre correspondance partielle du motif de recherche
set hlsearch      "Surligne les occurrences de la chaîne recherchée
set ignorecase    "Ignore la casse dans les motifs de recherche
set mouse=a       "Permet au click de souris de modifier la position du curseur
set cursorline    "Soulignement de la ligne courante
highlight CursorLine guibg=grey    "Surligne la ligne courante en gris
set completeopt=menuone,longest,preview

"Secure
" set modelines=0


set laststatus=2  " Affiche la barre d'état en plus de la barre de commande
" set statusline=%-Y%k%=%f%10p%%%10l/%L "Format de la barre d'état
set statusline=%-Y%k%=%f%10p%%%10l/%L "Format de la barre d'état
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set nofoldenable


set wildmenu
set wildmode=list:longest " Affiche une liste lors de complétion de commandes/fichiers
set wildignore=*.pyc

"set backup         " Activer la sauvegarde
"set backupdir=$HOME/.vim-backup

"Vundle
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Plugins here:
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" original repos on github
"
" Interface
Plugin 'bling/vim-airline'

" Fichier
Plugin 'scrooloose/nerdtree.git'

" Déplacement
Plugin 'Lokaltog/vim-easymotion'

" Programmation general
" Plugin 'scrooloose/syntastic'
" Asynchronous Lint Engine
Plugin 'w0rp/ale'
Plugin 'msanders/snipmate.vim'
" Plugin 'int3/vim-taglist-plus'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'

"Python
Plugin 'davidhalter/jedi-vim'
" Plugin 'ambv/black'
" Plugin 'Jinja'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'python-mode/python-mode'
Plugin 'mgedmin/python-imports.vim'
" Plugin 'tmhedberg/SimpylFold'
map <F5>    :ImportName<CR>
map <C-F5>  :ImportNameHere<CR>

" HTML/CSS
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'


" RST
" Plugin 'nvie/vim-rst-tables'

" CSV
" Plugin 'chrisbra/csv.vim'
"
" GIT
Plugin 'laarmen/git-vim.git'
"
" TypeScript
Plugin 'leafgarland/typescript-vim.git'

" Orthographe/Grammaire
Plugin 'dpelle/vim-Grammalecte'
let g:grammalecte_cli_py='~/Program/Grammalecte-fr-v0.6.4/grammalecte-cli.py'
"
" Orga
Plugin 'jceb/vim-orgmode'
"Déplacement dans les fichier/buffer
Plugin 'L9'
Plugin 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
" Remplacement
" Plugin 'und'
" Trier
Plugin 'YankRing.vim'
Plugin 'utl.vim'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kshenoy/vim-signature'
Plugin 'ohjames/tabdrop.git'

call vundle#end()
"End vundle

filetype plugin indent on     " required!
"
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
" let g:pymode_rope = 1
" let g:pymode_folding = 0
" let g:pymode_python = 'python3'
autocmd FileType python setlocal completeopt-=preview
nnoremap <silent> <F11> :YRShow<CR>
" let g:SimpylFold_docstring_preview = 1

"Solarized
colorscheme solarized
hi normal   ctermfg=black  ctermbg=white

"Syntastic
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': ['ruby', 'python', 'json'],
"                            \ 'passive_filetypes': ['puppet', 'rst'] }
" let g:syntastic_python_checkers = ['pyflakes']

"Ale
let g:ale_completion_enabled = 1
let g:ale_linters = {'html': [],
                   \ 'python': ['pylint','flake8']}
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_virtualenv_dir_names = []

"Tagbar
let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
    \ }

syntax enable
set background=light
let g:solarized_termcolors=256


"PowerLine
let Powerline_symbols = 'fancy'
let icons_path = "/home/rdl/.vim/img/"
let g:Fi_Flags = { "arrow" : [icons_path."Coffee.png", "> ", 1, "texthl=Title"]}
"Airline
let g:airline_powerline_fonts = 1

" set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<

" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" noremap <C-K> <C-U>  " Déplace 1/2 écran vers le haut
" noremap <C-J> <C-D>  " Déplace 1/2 écran vers le bas
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <tab> >>
map <S-tab> <
vmap <tab> >gv
vmap <S-tab> <gv
map <F2> :%s/  *$// <CR>
" map <F5> :set paste!<Bar>set paste?<CR>
map <F6> :set number!<Bar>set number
" nnoremap <silent> <F8> :TlistToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>
syntax on         "Activation de la coloration syntaxique
" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C><Tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
" map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
" nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nnoremap <C-f><C-f> :FufFile<CR>
map <C-_> :tab tag <C-R>=expand("<cword>")<CR><CR>
vnoremap <C-c> "*y

"filetype plugin indent on  "Detection to determine the type of the current file

au BufNewFile,BufRead *.rst so  $VIMRUNTIME/syntax/rst.vim
au BufNewFile,BufRead *.jinja so  $VIMRUNTIME/syntax/xml.vim
au BufNewFile,BufRead *.rst setlocal spell spelllang=fr
" let g:languagetool_jar=$HOME . '/Program/LanguageTool/LanguageTool.jar'
"Completion Python
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" :au BufWinEnter *.py let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" :au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" autocmd filetype html        set omnifunc=htmlcomplete#CompleteTags
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType css setlocal iskeyword+=-
augroup END
au filetype javascript  set omnifunc=javascriptcomplete#CompleteJS
au filetype c           set omnifunc=ccomplete#Complete
au filetype php         set omnifunc=phpcomplete#CompletePHP
au filetype ruby        set omnifunc=rubycomplete#Complete
au filetype sql         set omnifunc=sqlcomplete#Complete
au filetype xml         set omnifunc=xmlcomplete#CompleteTags
au filetype scss set shiftwidth=2  "Défini 4 espace comme taille d'indentation
au filetype scss set tabstop=4     "Défini 2 espace commet taille d'indentation
au filetype scss set softtabstop=4 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent

autocmd FileType html set shiftwidth=2  "Défini 4 espace comme taille d'indentation
autocmd FileType html set tabstop=2     "Défini 2 espace commet taille d'indentation
autocmd FileType html set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent

au FileType xml setlocal foldmethod=syntax
" au FileType python setlocal foldmethod=syntax

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
" imap <C-Space> <C-X><C-O>
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

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

" au FileType python call TextEnableCodeSnip('sqlpostgres', "'''", "'''", 'SpecialComment')

