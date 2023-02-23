let g:coc_node_path = '~/.nvm/versions/node/v18.14.2/bin/node'
let g:python3_host_prog = '/usr/bin/python3'

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let mapleader = " "

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "Tienes que instalar curl o primero instalar Vim Plug tú mismo"
    execute "q!"
  endif
  echo "Instalando Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" RAINBOW_PARENTHESES
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=4 " spaces for autoindenting
set softtabstop=4 " remove a full pseudo-TAB when i press <BS>

set encoding=UTF-8
" Required:

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" Recordar la posición del cursor

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END
set autoread


call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'preservim/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'

Plug 'tamton-aquib/staline.nvim'

Plug 'airblade/vim-gitgutter'

Plug 'Raimondi/delimitMate'

Plug 'wuelnerdotexe/vim-enfocado'

" FZF
" https://github.com/junegunn/fzf.vim
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'leafgarland/typescript-vim'

Plug 'vim-scripts/grep.vim'

Plug 'vim-scripts/CSApprox'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" TELESCOPE
" https://github.com/nvim-telescope/telescope.nvim
" Es un buscador difuso altamente extensible sobre listas

Plug 'voldikss/vim-floaterm'

Plug 'sindrets/winshift.nvim'

Plug 'petertriho/nvim-scrollbar'

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'metakirby5/codi.vim'

Plug 'folke/zen-mode.nvim'

Plug 'Pocco81/auto-save.nvim'

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'APZelos/blamer.nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

Plug 'kristijanhusak/vim-carbon-now-sh'

Plug 'mfussenegger/nvim-dap'
" DAP
Plug 'rcarriga/nvim-dap-ui'
" DAP UI

Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" https://github.com/folke/trouble.nvim

Plug 'ryanoasis/vim-devicons'

" Asycomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'folke/twilight.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" +++
" INDENT-BLANCKLINE
lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require "indent_blankline".setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" +++
" Dap
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>BB <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>BC <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

" +++
" CONFIGURACION FLOATERM
nnoremap <leader>tt :FloatermNew<cr>
nnoremap <leader>ty :FloatermToggle<cr>
nnoremap <leader>tp :FloatermNew python<cr>

" +++
" FZF CONFIGURACION
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Mapeo FZF
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" Mapeo UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
" Disparador de salto hacia adelante UltiSnips

let g:UltiSnipsJumpForwardTrigger="<tab>"
" Gatillo de expansion UltiSnips

let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" UltiSnips salta el gatillo hacia atrás

let g:UltiSnipsEditSplit="vertical"
" Division de edición de UltiSnips

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> <leader>tt :terminal<CR>
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Buscar y abrir un archivo para editarlo desde vim/neovim

noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Buscar, ingresar y abrir carpetas para encontrar

" Sintaxis para python
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

" +++
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
" Abrir nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" +++
" Movimiento de ventanas WINSHIFT
:nmap mm :WinShift

" +++
" CAMBIAR DE MODO
:imap ii <Esc>

set noshowmode
set ignorecase
filetype plugin indent on
set encoding=utf-8
set number relativenumber
set showmatch
set hidden
set backspace=indent,eol,start
syntax on
set wildmenu
set nohlsearch
set wrap linebreak nolist

" +++
" NERDTREE-GIT-PLUGIN
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1


" +++
" SPLITS CONFIGURACION
nnoremap <A-Up> :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <A-Down> :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <A-Right> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <A-Left> <Leader>Left :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" CAMBIAR DE SPLIT
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Cierra buffers de split o ventanas
nnoremap <silent> <C-q> :lclose<bar>b#<bar>:bd #<CR>
noremap <Leader>hh :<C-u>vsplit<CR>
" Crear un split horizontal

noremap <Leader>vv :<C-u>split<CR>
" Crear un split vertical

noremap <leader>w :w<cr>
noremap <leader>ii :w!<cr>
noremap <leader>iq :wq<cr>
noremap <leader>q :q<cr>
noremap <leader>qq :q!<cr>
noremap <leader><Left> u<cr>
noremap <leader><Right> <C-r><cr>
noremap <leader>PP :PlugInstall<cr>
noremap <leader>PU :PlugUpdate<cr>


" +++
" Asycomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Ventana emergene automatica
let g:asyncomplete_auto_popup = 1

" Ventana de vista previa
let g:asyncomplete_auto_completeopt = 1
set completeopt=menuone,noinsert,noselect,preview

" Cerrar automaticamente la ventana de vista previa cuando se completa
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" +++
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" +++
" GREP
" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" +++
" Movimiento pestaña
noremap <S-Right> :bn<CR>
noremap <S-left> :bp<CR>

" +++
" CODI CONFIGURACION
" PYTHON
let g:codi#interpreters = {
	\ 'python': {
		\ 'bin': 'python',
		\ 'prompt' : '^\(>>>\|\.\.\.\) ',
		\ },
	\ }

" HASKELL
let g:codi#interpreters = {
	\ 'haskell' : {
		\ 'prompt' : '^> ',
		\ },
	\ }

" JAVASCRIPT
let g:codi#interpreters = {
	\ 'javascript' : {
		\ 'rightalign' : 0,
		\ },
	\ }
let g:codi#aliases = {
	\ 'javascript.jsx' : 'javascript', 
	\ }

" +++
" BLAMER
let g:blamer_enabled = 1
let g:blamer_delay = 700
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_template = '<committer>, <committer-time> • <summary> • <committer-mail>'  " Opciones disponibles <author>, <author-mail>, <author-time>, <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>
let g:blamer_date_format = '%d/%m/%y %H:%M'
let g:blamer_relative_time = 0
highlight Blamer guifg= lightgrey

" +++
" RAINBOW_PARENTHESES
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = [233, 234]

" +++
" MARKDOWN PREVIEW
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'

nmap <leader>mda <Plug>MarkdownPreview
nmap <leader>mdq <Plug>MarkdownPreviewStop
nmap <leader>mdd <Plug>MarkdownPreviewToggle

" +++
" LIVE-SERVER HTML, CSS, JAVASCRIPT
noremap <leader>ll :Bracey<CR>
" detener live-server
noremap <leader>lq :BraceyStop<CR>
" recargar página
noremap <leader>lr :BraceyReload<CR>

" +++
" RENAMER
inoremap <silent> <F2> <cmd>lua require 'renamer'.rename()<cr>
nnoremap <silent> <leader>nn <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>nn <cmd>lua require('renamer').rename()<cr>
hi default link RenamerBorder Pmenu

" +++
" CARBON
vnoremap <F5> :CarbonNowSh<CR>

" +++
" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua << EOF
require "trouble".setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true,
    action_keys = {
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j"
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        auto_jump = {"lsp_definitions"},
        signs = {
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
            },
            use_diagnostic_signs = false
}
EOF

" +++
" Compilador Lenguajes
map <silent>0 :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'javascript'
exec "!node %"
elseif &filetype == 'python'
exec "!python3 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc


" +++
" CONFIG THEMES
set t_Co=256
colorscheme enfocado
let g:enfocado_style = 'nature' " Available: `nature` or `neon`.
noremap <silent>1 :colorscheme enfocado<CR>
noremap <silent>2 :colorscheme onedark<CR>
noremap <silent>3 :colorscheme peachpuff<CR>
noremap <silent>4 :colorscheme embark<CR>
noremap <silent>5 :colorscheme pink-panic<CR>

" +++
" AIRLINE ( o BAR LINE)
" 1) staline
" 1.1) Configuracion
lua << EOF
require'staline'.setup {
	defaults = {
		fg = "#ffffff",
                bg = "none",
		cool_symbol = " ", -- ( / ArchLinux), ( ⊞ Windows), ( ⌘ ¿Mac?) 
		left_separator = "《",
		right_separator = "》",
		full_path = false,
		mod_symbol = "",
		line_column = "%l:%c [%L]",
		true_colors = false,
		branch_symbol = " ",
		font_active = "bold",
	},
	
	mode_colors = {
		n  = "#00FFAB",
		i  = "#E13A9D",
		c  = "#F9F871",
		v  = "#F24A72",
	},
	mode_icons = {
		n = "NORMAL",
		i = "INSERT",
		c = "COMMANDs",
		v = "VISUAL",
	},
	sections = {
		left = {
			'',
			'-  spaVim Lite ',' ',
			'right_sep','%p%%',' ','right_sep',"❖","file_size",
		},
		mid  = {'mode','branch'},
		right= {
			'cool_symbol', ' ',
			'left_sep',' ', '%F',' ', '',
			'', ' ',
		},
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' '},
	},
}
EOF

" +++++
" COLORIZER NEOVIM
lua << EOF
  DEFAULT_OPTIONS = {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = false;        -- #RRGGBBAA hex codes
	rgb_fn   = false;        -- CSS rgb() and rgba() functions
	hsl_fn   = false;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
}
EOF

" +++
" BUFFERLINE Configuracion
lua << EOF
require'bufferline'.setup{}
EOF

" +++++
" Configuracion SCROLLBAR
lua << EOF
require"scrollbar".setup{

    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    handle = {
        text = " ",
        color = nil,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Search = {
            text = { "-", "=" },
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        diagnostic = true,
        search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
    },
}
EOF

" +++++
" AUTOSAVE
lua << EOF
require"auto-save".setup{
	enable = true,
	trigger_events = {"InsertLeave", "TextChanged"},
	write_all_buffers = false,
	debounce_delay = 135,
	callbacks = {
		enabling = nil,
		disabling = nil,
		before_asserting_save = nil,
		before_saving = nil,
		after_saving = nil
	}
}
EOF

lua << EOF
require"twilight".setup {}
EOF

" +++
" MODO ZEN
lua << EOF
require"zen-mode".setup {
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
            },

        },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false,

            },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        }

    }
EOF

" +++
" LSP configuration
lua << EOF
require'nvim-lsp-installer'.setup {
    automatic_installation = true,
    ui = {
        icons = {
            check_outdated_servers_on_open = true,
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
            border = "|",
            },
            keymaps = {
                toggle_server_expand = "<CR>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",check_outdated_servers = "C",
                uninstall_server = "X",
            }
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
        github = {
            download_url_template = "https://github.com/%s/releases/download/%s/%s",
        }
    }
EOF


