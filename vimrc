" We need to make sure that vim is not attempting to retain compatibility with vi,
" its predecessor. This is a vundle requirement. When vim attempts to be compatible
" it disables most of the features that make it worth using over vi.
set nocompatible

" We also want to turn off the default filetype controls for now because the way
" that vim caches filetype rules at runtime interferes with the way that vundle
" alters the runtime environment. We will change this back later
filetype off

" We'll need to then adjust vim's runtime path to include the vundle location we 
" cloned from GitHub
set rtp+=~/.vim/bundle/Vundle.vim

" After that, we will call the vundle initialization function
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" To make nerdtree play well with tabs
Plugin 'jistr/vim-nerdtree-tabs'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Zenburn color scheme for terminal mode
Plugin 'jnurmine/Zenburn'

" You can have VIM check your syntax on each save with the syntastic extension
Plugin 'scrooloose/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" Want to search for basically anything from VIM? Check out ctrlP. 
" CTRL P enables the search and then just start typing.
" If your search matches anything close to the file you’re looking for, it will find it. 
Plugin 'ctrlpvim/ctrlp.vim'

" Lean & Mean Powerline written in vimscript
Plugin 'vim-airline/vim-airline'

" vim plugin
Plugin 'fatih/vim-go'

" lisp environment
Plugin 'l04m33/vlime', {'rtp': 'vim/'}

" balance parenthesis
Plugin 'kovisoft/paredit'

" enhanced tmux integration
Plugin 'christoomey/vim-tmux-navigator'

" git integration
Plugin 'tpope/vim-fugitive'

" used for displaying thin vertical lines at each indentation level for code indented with spaces
Plugin 'Yggdroot/indentLine'

" allows you to configure % to match more than just single characters. You can match words and even regular expressions
Plugin 'tmhedberg/matchit'

" quickly toggle comments
Plugin 'tomtom/tcomment_vim'

" easily surround tags
Plugin 'tpope/vim-surround'

" auto create tags on save for go-to functionality
Plugin 'xolox/vim-easytags'

" vim-easytags dependency
Plugin 'xolox/vim-misc'

" elixir plugin
Plugin 'elixir-editors/vim-elixir'

" vim-markdown dependency
Plugin 'godlygeek/tabular'

" markdown support
Plugin 'plasticboy/vim-markdown'

" highlight useless whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" antlr grammars
Plugin 'dylon/vim-antlr'

" All of your Plugins must be added before the following line. Required.
call vundle#end()

" Required
filetype plugin indent on

" Show Line numbers
set number

" Together with 'set lbr' avoids splitting words when they need to go to the next
" line
set formatoptions=l
set lbr

" Highlight current line
set cursorline

" Highlight current column
set cursorcolumn

" With this command vim's working directory is always the same as the file you are
" editing
set autochdir

" Disable arrow key
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" override up and down movements to recognize wrapped text by remapping them to add the g key
nnoremap j gj
nnoremap k gk

" split navigations. Use the same keybindings as tmux to split
nnoremap <C-a> <C-w>

" map 0 to ^ in normal mode. ^ takes me to first non-white char in line
nnoremap 0 ^

" hitting F2 in normal mode now allows me to go at the end of a word 
" directly in insert mode
nnoremap <F2> ea

" Turn on syntax highlights
syntax enable

" highlight all search matches
set hlsearch

" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. 
" For example, /The would find only "The", while /the would find "the" or "The" etc. 
set ignorecase
set smartcase

" After a search hits an entry, the entry will be highlighted due to :set hlsearch. 
" So, press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ------------------------------------- Nerdtree Config

" Open/close NERDTree Tabs with \t while in normal mode
" nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" ------------------------------------- Solarized Config

if has('gui_running')
  set background=light
  colorscheme solarized
else
  colorscheme zenburn
endif

"Solarized also ships with a dark and light theme. To make switching between them very easy (by pressing F5) add
call togglebg#map("<F5>")

" -----------------------------------------------------

" give me indication where I am in the buffer (top, bottom, and %)
set ruler

" Flagging Unnecessary Whitespace
" We also want to avoid extraneous whitespace. We can have VIM flag that for us so that it’s easy to spot – and then remove.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.hs match BadWhitespace /\s\+$/

" For the most part, you should be using UTF8 when working with Python, especially if you’re working with Python 3. 
" Make sure VIM knows that with the following line:
set encoding=utf-8

"make your code look pretty
let python_highlight_all=1

" ------------------------------------- PowerLine

" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" The default setting of 'laststatus' is for the statusline to not appear until a split is created. 
" If you want it to appear all the time, add the following to your vimrc
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" ------------------------------------- clipboard

" copy/paste from/to vim from/to X application using p and ctrl-c ctrl-v
set clipboard=unnamedplus

" You can also have the Visual selection automatically copied to the clipboard. If you
" make a Visual selection, you can switch to another application (such as your mail reader) and paste.
set go+=a

" -------------------------------------

" faster redrawing
set ttyfast

" if the line is longer than the horizontal screen space, it does *not* break
" it and continue
set nowrap

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" set listchars=tab:▸\,eol:¬,trail:~,extends:>,precedes:<,space:␣

" make vim put swap, backup and undo files in a special location instead of the 
" working directory of the file being edited
" Using double trailing slashes in the path tells vim to enable a feature where 
" it avoids name collisions. For example, if you edit a file in one location 
" and another file in another location and both files have the same name, you 
" don't want a name collision to occur in ~/.vim/swap/. If you specify ~/.vim/swap// 
" with two trailing slashes vim will create swap files using the whole path of
" the files being edited to avoid collisions (slashes in the file's path will 
" be replaced by percent symbol %).
" For example, if you edit /path/one/foobar.txt and /path/two/foobar.txt, then you will see two swap files in ~/.vim/swap/ that are named %path%one%foobar.txt and %path%two%foobar.txt, respectively.
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

" Tabs are four columns wide. Each indentation level is one tab.
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab

" For indents that consist of 4 space characters but are entered with the tab key:
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" set font on windows
set guifont=Consolas:h12

" pretty print xml
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Vim jump to the last position when reopening a file.
" It works by creating an autocommand for the BufReadPost event 
" -- i.e. a vim command that is executed every time after vim loads a file from disk. 
" The command checks if the '"' mark is defined and sensible 
" (the " mark stores the last position in the current file and is saved in the ~/.viminfo file), 
"  and if so, tells vim to jump to it
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" syntax highlight antlr grammar
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
