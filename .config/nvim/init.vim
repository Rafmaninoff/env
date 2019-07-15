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
		nnoremap <leader>a :NERDTreeToggle<cr>
	"tmux integration
	Plug 'christoomey/vim-tmux-navigator'
	"distraction-free writing in vim
	Plug 'junegunn/goyo.vim'
		nnoremap <F3>f :goyo \| set linebreak<cr>
	Plug 'vim-scripts/vim-auto-save'
		let g:auto_save_silent = 1
"programming-related
	"comment out with gc
	Plug 'tpope/vim-commentary'
	Plug 'jpalardy/vim-slime'	"throw around text to terminals for quick debugging.
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'SirVer/ultisnips'
		let g:UltiSnipsExpandTrigger = '<tab>'
		let g:UltiSnipsJumpForwardTrigger = '<tab>'
		let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
		let g:UltiSnipsEditSplit = 'vertical'
		let g:UltiSnipsSnippetsDir = "/home/raf/ultisnips"
		let g:UltiSnipsEnableSnipMate = 0
		let g:UltiSnipsSnippetDirectories=["/home/raf/.ultisnips", ".ultisnips"]
		let g:UltiSnipsUsePythonVersion = 3
		cmap use UltiSnipsEdit
	Plug 'w0rp/ale'	"Linting engine and lsp client
		let g:airline#extensions#ale#enabled = 1	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
	set scrolloff=5
	set nohlsearch
	set noshowmode 			" showing the mode is redundant with airline
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
	colorscheme gruvbox
	set background=dark

"copying and pasting from system clipboard.
	 vnoremap <C-c> "+y
	 nmap <C-w> "+P

"automatically make files containing shebang executable
	fu MakeScriptsExecutable()
		if getline(1) =~ "^#!"
			silent !chmod u+x %:p
		endif
	endfu

	au BufWritePost * call MakeScriptsExecutable()

"do certain stuff with certain files
	au BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts 

"split movement
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

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

