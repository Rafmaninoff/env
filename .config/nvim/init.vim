		call plug#begin('~/.local/share/nvim/plugged')

"Aesthetic stuff
	"fancy statusline and themes
	Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
			let g:airline_powerline_fonts = 1
			let g:airline_theme = 'gruvbox'
	"vim theme
	Plug 'morhetz/gruvbox'
		let g:gruvbox_italic = '1'
"misc stuff
	"surround stuff with things
	Plug 'tpope/vim-surround'
	"file browser
	Plug 'scrooloose/nerdtree'
	"tmux integration
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'junegunn/goyo.vim' "distraction-free writing in vim
		nnoremap <F3>f :goyo<CR>
	Plug 'vim-scripts/vim-auto-save'
		let g:auto_save_silent = 1
	Plug 'vim-scripts/restore_view.vim'
		set viewoptions=cursor,folds,slash,unix
"programming-related
	"comment out with gc
	Plug 'tpope/vim-commentary'
	Plug 'jpalardy/vim-slime'	"throw around text to terminals for quick debugging.
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'baskerville/vim-sxhkdrc' "sxhkdrc syntax file
	Plug 'SirVer/ultisnips'
		let g:UltiSnipsExpandTrigger = '<tab>'
		let g:UltiSnipsJumpForwardTrigger = '<tab>'
		let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
		let g:UltiSnipsEditSplit = 'vertical'
		let g:UltiSnipsEnableSnipMate = 0
		let g:UltiSnipsUsePythonVersion = 3
		cmap use UltiSnipsEdit
	Plug 'w0rp/ale'	"Linting engine and lsp client
		let g:airline#extensions#ale#enabled = 1
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'lervag/vimtex'	"LaTeX plugin
		let g:vimtex_compiler_progname = 'nvr'
		let g:tex_flavor='latex'
		let g:vimtex_view_method='zathura'
		let g:vimtex_quickfix_mode=0
		set conceallevel=1
		let g:tex_conceal='abmgs'
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
		let g:livepreview_previewer = 'zathura'
	call plug#end()

"basic stuff
"line numbers and relative line numbers
	set number
	set relativenumber
"automatic saving after every change
	set autowriteall
"read if file is changed externally
	set autoread
	syntax on
	filetype plugin indent on
	set encoding=utf-8
	colorscheme gruvbox "colourscheme
	set scrolloff=5
	set nohlsearch
	set noshowmode 			" showing the mode is redundant with airline
	set tabstop=4
	set softtabstop=4
	nnoremap j gj
	nnoremap k gk
	set shiftwidth=4
	let mapleader = ","
	let leader = ","
	nnoremap Q <nop> 		" avoid switching to ex mode
	noremap Y y$			" consistency
	set wildmenu
	set wildmode=longest,list,full	" autocompletion
	"disable automatic commenting on newline
	au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	set splitbelow splitright	"splits open to the bottom and right"
	set termguicolors
	set background=dark
	"Always show the signs column
	set signcolumn=yes
	"shorten update times
	set updatetime=300
	nnoremap c "_c
	set linebreak

"guide navigation
	nnoremap <leader><leader><space> /<+x+><CR>cf>
	inoremap <leader><leader><space> <Esc>/<+x+><CR>cf>
	nnoremap <leader><leader>i<space> a<+x+><Esc>
	inoremap <leader><leader>i<space> <+x+>


"Plugin configuration
	"nerdtree
		nnoremap <leader>a :NERDTreeToggle<cr>
	"coc.nvim
		nmap <leader>rn <Plug>(coc-rename)

"copying and pasting from system clipboard.
	 vnoremap <C-c> "+y
	 nmap <C-w> "+P

au BufWritePre * %s/\s\+$//e "delete trailing whitespace on write
au BufWritePre * %s/\n\+\%$//e "delete newlines at the end of file on write

"compile the file
map <leader>c :w! \| !compiler <c-r>%<CR>
"open the corresponding output
map <leader>p :!openout <c-r>%<CR><CR>

"automatically make files containing shebang executable
	fu MakeScriptsExecutable()
		if getline(1) =~ "^#!"
			silent !chmod x %:p
		endif
	endfu

	au BufWritePost * call MakeScriptsExecutable()

"do certain stuff with certain files
	au BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts
	au BufWritePost ~/.Xresources !xrdb ~/.Xresources
	au BufWritePost ~/.config/sxhkd/sxhkdrc	!pkill -SIGUSR1 sxhkd

"split movement
	cmap tsp :sp +te
	cmap vts :vs +te
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	nnoremap <M-x> <C-w>x
	nnoremap <M-r> <C-w>r
	nnoremap <M-h> <C-w>H
	nnoremap <M-j> <C-w>J
	nnoremap <M-k> <C-w>K
	nnoremap <M-l> <C-w>L

"block arrow keys to force me to not use them
	nnoremap <up> <nop>
	nnoremap <down> <nop>
	nnoremap <left> <nop>
	nnoremap <right> <nop>
	inoremap <up> <nop>
	inoremap <down> <nop>
	inoremap <left> <nop>
	inoremap <right> <nop>
	vnoremap <up> <nop>
	vnoremap <down> <nop>
	vnoremap <left> <nop>
	vnoremap <right> <nop>
