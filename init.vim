let g:coc_node_path = '~/.nvm/versions/node/v16.17.0/bin/node'
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


"  LAZYGIT
autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()

set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=4 " spaces for autoindenting
set softtabstop=4 " remove a full pseudo-TAB when i press <BS>

set encoding=UTF-8
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'folke/twilight.nvim'
" Complemento que atenúa las partes inactivas del código que está editando con
" TreeSitter : https://github.com/folke/twilight.nvim

Plug 'preservim/nerdtree'
" https://github.com/preservim/nerdtree
" Explorador de archivos, para navegar visualmente por jerarquia de
" directorios, abrir archivos o editarlos

Plug 'Xuyuanp/nerdtree-git-plugin'
" https://github.com/Xuyuanp/nerdtree-git-plugin
" Complemento de NERDTree que muestra indicadores de estado de Git

" Icon pack && Fonts
Plug 'ryanoasis/vim-devicons'
" Plug 'mhinz/vim-signify'

"  LAZYGIT (leer completo)
Plug 'kdheepak/lazygit.nvim'
" Complemento para integrar un administrador de git

Plug 'mhinz/vim-startify'
" https://github.com/mhinz/vim-startify

Plug 'tpope/vim-fugitive'
" https://github.com/tpope/vim-fugitive
" Complemento de Vim para Git ( :help fugitive para ver todos los comandos
" para git)

Plug 'tamton-aquib/staline.nvim'
" BAR LINE
" https://github.com/tamton-aquib/staline.nvim

Plug 'airblade/vim-gitgutter'
" https://github.com/airblade/vim-gitgutter
" Complemento de Vim que muestra una diferenca de git en la columna mediante
" un sigo (+ -) acerca de que lineas se han agregado, modificado o eliminado

Plug 'Raimondi/delimitMate'
" https://github.com/Raimondi/delimitMate
" Complemento que proporciona el cierre automatico de comilla, paréntesis,
" corchetes, etc

Plug 'lukas-reineke/indent-blankline.nvim'
" https://github.com/lukas-reineke/indent-blankline.nvim
" Complemento para agregar lineas de sangría a todas las línea (incluidas las
" vacias)

" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

" Python
Plug 'davidhalter/jedi-vim'

" Asycomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'

" THEME 1
Plug 'shaunsingh/moonlight.nvim'
" https://github.com/shaunsingh/moonlight.nvim
" THEME 2
Plug 'wuelnerdotexe/vim-enfocado'
" https://github.com/wuelnerdotexe/vim-enfocado
" THEME 3
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
" https://github.com/embark-theme/vim


" FZF
" https://github.com/junegunn/fzf.vim
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Snippets
Plug 'SirVer/ultisnips'
" https://github.com/SirVer/ultisnips
" UltiSnips muestras fragmentos que pueden ir despúes de lo que se vaya
" codificando, python

Plug 'honza/vim-snippets'
" https://github.com/honza/vim-snippets
" Fragmentos de snipMate y UltiSnips, contiene fragmentos de archivos para
" varios lenguajes de programación

Plug 'leafgarland/typescript-vim'
" Colores o soporte para Typescript

Plug 'prabirshrestha/vim-lsp'
"Complemento Async Language Server Protocol para vim8 y neovim, documentacion
"aqui: https://github.com/prabirshrestha/vim-lsp

Plug 'mattn/vim-lsp-settings'
" Configuraciones automaticas para Language Server para vim-lsp

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'vim-scripts/grep.vim'
" Intrega herramientas grep, fgrep, egrep, y agrep con Vim 

Plug 'vim-scripts/CSApprox'
" Hacer que el esquema de color sea justo, o algo asi

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" TELESCOPE
" https://github.com/nvim-telescope/telescope.nvim
" Es un buscador difuso altamente extensible sobre listas

Plug 'voldikss/vim-floaterm'
" Movimiento de ventanas WINDSHIFT
" https://github.com/sindrets/winshift.nvim

Plug 'sindrets/winshift.nvim'

Plug 'petertriho/nvim-scrollbar'
" Complemento para scrollbar

Plug 'jbyuki/instant.nvim'
" Complemento de Edicion colaborativa que funciona en un servidor, al esta en
" un servidor todos los clientes pueden acceder : https://github.com/jbyuki/instant.nvim

Plug 'numToStr/Comment.nvim'
" Commentarios : https://github.com/numToStr/Comment.nvim

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Bufferline : https://github.com/akinsho/bufferline.nvim#installation

Plug 'metakirby5/codi.vim'
" CODI
" Output live del código
" https://github.com/metakirby5/codi.vim  

Plug 'folke/zen-mode.nvim'
" MODO ZEN
" https://github.com/folke/zen-mode.nvim

Plug 'Pocco81/auto-save.nvim'
" https://github.com/Pocco81/auto-save.nvim
" AUTO-SAVE

Plug 'junegunn/rainbow_parentheses.vim'
" Rainbow_parentheses Parentesis color
" https://github.com/junegunn/rainbow_parentheses.vim

Plug 'APZelos/blamer.nvim'
" Inspirado en Gitlens para Nvim BLAMER
" https://github.com/APZelos/blamer.nvim

Plug 'norcalli/nvim-colorizer.lua'
" Colorizador rápido de neovim
" https://github.com/norcalli/nvim-colorizer.lua

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Markdown Preview
" https://github.com/iamcco/markdown-preview.nvim

Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" https://github.com/turbio/bracey.vim
" Live-server html, css, javascript

Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }
" Renombrar
" https://github.com/filipdutescu/renamer.nvim

Plug 'kristijanhusak/vim-carbon-now-sh'
" Carbon (capturar pedazos de código en imagen)
" https://github.com/kristijanhusak/vim-carbon-now-sh

Plug 'mfussenegger/nvim-dap'
" DAP
Plug 'rcarriga/nvim-dap-ui'
" DAP UI

call plug#end()


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


" +++++
" DAP DEBUGGER
lua << EOF
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⭕', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='Ⓡ', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='Ⓛ', texthl='', linehl='', numhl=''})

EOF

lua << EOF
-- +++++ DAP PYTHON
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

local venv = os.getenv("VIRTUAL_ENV")
command = vim.fn.getcwd() .. string.format("%s/bin/python",venv)

-- +++++ DAP JS

EOF

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>BB <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>BC <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>


" +++++
" CARBON
" Seleccionar texto en modo visual e ingresar el comando :CarbonNowSh, o
" teclear el mapeo
vnoremap <F5> :CarbonNowSh<CR>
" let g:carbon_now_sh_base_url = 'http://localhost:3000'
" let g:carbon_now_sh_browser = 'google-chrome'
" let g:carbon_now_sh_options =
"\ { 'ln': 'true',
"  \ 'fm': 'Source Code Pro' }


" +++++
" RENAMER
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
nnoremap <silent> <leader>nn <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>nn <cmd>lua require('renamer').rename()<cr>

hi default link RenamerBorder Pmenu

lua << EOF
local mappings_utils = require('renamer.mappings.utils')
require('renamer').setup {
    -- The popup title, shown if `border` is true
    title = 'Rename',
    -- The padding around the popup content
    padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    },
    -- The minimum width of the popup
    min_width = 15,
    -- The maximum width of the popup
    max_width = 45,
    -- Whether or not to shown a border around the popup
    border = true,
    -- The characters which make up the border
    border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    -- Whether or not to highlight the current word references through LSP
    show_refs = true,
    -- Whether or not to add resulting changes to the quickfix list
    with_qf_list = true,
    -- Whether or not to enter the new name through the UI or Neovim's `input`
    -- prompt
    with_popup = true,
    -- The keymaps available while in the `renamer` buffer. The example below
    -- overrides the default values, but you can add others as well.
    mappings = {
        ['<c-i>'] = mappings_utils.set_cursor_to_start,
        ['<c-a>'] = mappings_utils.set_cursor_to_end,
        ['<c-e>'] = mappings_utils.set_cursor_to_word_end,
        ['<c-b>'] = mappings_utils.set_cursor_to_word_start,
        ['<c-c>'] = mappings_utils.clear_line,
        ['<c-u>'] = mappings_utils.undo,
        ['<c-r>'] = mappings_utils.redo,
    },
    -- Custom handler to be run after successfully renaming the word. Receives
    -- the LSP 'textDocument/rename' raw response as its parameter.
    handler = nil,
}
EOF


" +++++
" LIVE-SERVER HTML, CSS, JAVASCRIPT
" iniciar live-server
noremap <leader>ll :Bracey<CR>

" detener live-server
noremap <leader>lq :BraceyStop<CR>

" recargar página
noremap <leader>lr :BraceyReload<CR>


" +++++
" MARKDOWN PREVIEW
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
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

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'

" example
nmap <leader>mda <Plug>MarkdownPreview
nmap <leader>mdq <Plug>MarkdownPreviewStop
nmap <leader>mdd <Plug>MarkdownPreviewToggle


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


" +++++
" BLAMER
let g:blamer_enabled = 1
let g:blamer_delay = 500 " Demora en mostrar el mensaje, dejarlo muy bajo puede ocasionar problemas de rendimiento, por defecto = 1000
let g:blamer_show_in_visual_modes = 1 " blamer en modo visual, por defecto en 1
let g:blamer_show_in_insert_modes = 1 " blamer en modo insertar, por defecto en 1
let g:blamer_prefix = ' > ' " Prefijo que se agregará a la plantilla
" BLAMER template
let g:blamer_template = '<committer>, <committer-time> • <summary> • <committer-mail>'  " Opciones disponibles <author>, <author-mail>, <author-time>, <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>

" Formato hora
let g:blamer_date_format = '%d/%m/%y %H:%M'
let g:blamer_relative_time = 0 "  Muestra la fecha de confirmación en formato relativo, por defecto 0

"color del mensaje 
highlight Blamer guifg= lightgrey


" +++++
" RAINBOW_PARENTHESES
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]


" +++++
" INDENT-BLANCKLINE
lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF


" +++++
" AUTOSAVE
lua << EOF
require("auto-save").setup({
	enable = true,
	execution_message = {
		message = function()
		return ("Autosave: save at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18,
		cleaning_interval = 1250,
	},
	trigger_events = {"InsertLeave", "TextChanged"},
	condition = function (buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if
			fn.getbufvar (buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"),{}) then
			return true
		end
		return false
	end,
	write_all_buffers = false,
	debounce_delay = 135,
	callbacks = {
		enabling = nil,
		disabling = nil,
		before_asserting_save = nil,
		before_saving = nil,
		after_saving = nil
	}
})
EOF


" +++++
" MODO ZEN
lua << EOF
	require("zen-mode").setup {
		window = {
			backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    			width = 120, -- width of the Zen window
    			height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    			options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    			},
  		},
  		plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    			options = {
      				enabled = true,
      				ruler = false, -- disables the ruler text in the cmd line area
      				showcmd = false, -- disables the command in the last line of the screen
    			},
    			twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    			gitsigns = { enabled = false }, -- disables git signs
    			tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    			kitty = {
      				enabled = false,
      				font = "+4", -- font size increment
    			},
  		},
  -- callback where you can add custom code when the Zen window opens
  		on_open = function(win)
  		end,
  -- callback where you can add custom code when the Zen window closes
  		on_close = function()
  		end,
}
EOF


" +++++
" LSP configuration
lua << EOF
require('nvim-lsp-installer').setup({
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
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
})
EOF

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.lsp.set_log_level("debug")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
EOF


" +++++
"  TELESCOPE
lua << EOF
require('telescope').setup {
    defaults = {
       vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
       },
       prompt_prefix = " ⌦  ", -- 
       selection_caret = "  ",
       entry_prefix = "  ",
       initial_mode = "insert",
       selection_strategy = "reset",
       sorting_strategy = "ascending",
       layout_strategy = "horizontal",
       layout_config = {
          horizontal = {
             prompt_position = "top",
             preview_width = 0.55,
             results_width = 0.8,
          },
          vertical = {
             mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
       },
       file_sorter = require("telescope.sorters").get_fuzzy_file,
       file_ignore_patterns = {},
       generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
       path_display = { "absolute" },
       winblend = 0,
       border = {},
       borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
       color_devicons = true,
       use_less = true,
       set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
       file_previewer = require("telescope.previewers").vim_buffer_cat.new,
       grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
       qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
       -- Developer configurations: Not meant for general override
       buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    extensions = {
       fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
       },
       media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg" },
          find_cmd = "rg", -- find command (defaults to `fd`)
       },
    },
}
EOF


" +++++
" CODI CONFIGURACION
" INTERPRETES CODI (CONFIGURACIONES)
" Documentacion acerca de eso :h codi-configurartion o en https://github.com/metakirby5/codi.vim/blob/master/doc/codi.txt
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

" ALIASES
" Un diccionario de alias de tipo de archivo de intérprete definidos por el usuario. Esto le permite utilizar un intérprete para más de un Tipo de archivo. Por ejemplo, puede crear un alias javascript.jsx para javascript para que se pueda usar el intérprete de JavaScript (nodo) para el tipo de archivo javascript.jsx :

let g:codi#aliases = {
	\ 'javascript.jsx' : 'javascript', 
	\ }


" +++++
" Ejecutar el archivo actual de python
noremap <leader><p :!python3 %<CR>
noremap <leader><j :!node %<CR>


" +++++
" BUFFERLINE Configuracion
set termguicolors
lua << EOF
require('bufferline').setup{}
EOF

noremap <S-Right> :bn<CR>
" Pasar a la pestaña siguiente

noremap <S-left> :bp<CR>
" Pasar a la pestaña anterior


" +++++
" LAZYGIT
let g:lazygit_floating_window_winblend = 0 " Transparencia de ventana flotante
let g:lazygit_floating_window_scaling_factor = 0.9 " factor de escala para ventana floante
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customizar los caracteres de la esquina de la ventana emergente lazygit
let g:lazygit_floating_window_use_plenary = 1 " Usar plenary.nvim para administrar la ventana flotante si esta disponible (en este caso activado ya que se cuenta con plenary)
let g:lazygit_use_neovim_remote = 0 " Colocar en 0 si neovim remote NO esta instalado

" Mapeo LAZYGIT
nnoremap <silent> <leader>gg :LazyGit<CR>

lua << EOF
require('telescope').load_extension('lazygit')
EOF


" +++++
" Comentarios 
lua << EOF
require('Comment').setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
        line = 'gcc',
	block = 'gbc',
    },
    
    opleader = {
	    line = 'gc',
	    block = 'gb',
    },

    extra = {
	    above = 'gt',
	    below = 'gv',
	    eol = 'gj',
    },

    mappings = {
	    basic = true,
	    extra = true,
	    extended =true,
    },

    pre_hook = nil,
    post_hook = nil,
})

EOF


" +++++
" Configuracion INSTANT servidor de edicion colaborativa
let g:instant_username = 'YourUserName'
" Mas configuraciones acerca de la personalizacion en : https://github.com/jbyuki/instant.nvim/wiki/Customization


" +++++
" Configuracion SCROLLBAR
lua << EOF
require("scrollbar").setup()

require("scrollbar").setup({

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
})
EOF


" +++++
" CONFIG THEMES
set t_Co=256
colorscheme moonlight "1

noremap <silent>1 :colorscheme enfocado<CR>
noremap <silent>2 :colorscheme moonlight<CR>
noremap <silent>3 :colorscheme peachpuff<CR>
noremap <silent>4 :colorscheme embark<CR>
noremap <silent>5 :colorscheme pink-panic<CR>


" colorscheme enfocado "2
let g:enfocado_style = 'neon' " Available: nature or neon
" NOTE: To see a list of all available plugins, run
" `:h enfocado-colorscheme` at the vim commandline.
let g:enfocado_plugins = [
  \ 'cmp',
  \ 'fern',
  \ 'fzf',
  \ 'gitgutter',
  \ 'glyph-palette',
  \ 'illuminate',
  \ 'indent-blankline',
  \ 'lsp',
  \ 'matchup',
  \ 'netrw',
  \ 'plug',
  \ 'startify',
  \ 'visual-multi'
  \ ]

" colorscheme embark "3
" colorscheme pink-panic "4


" +++++
" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings =0


" +++++
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


" +++++
" GREP
" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


" +++++
" CONFIGURACION ASYNCOMPLETE
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Ventana emergene automatica
let g:asyncomplete_auto_popup = 1
" en caso de deshabilitar esta opción dejar en 0

" Ventana de vista previa
let g:asyncomplete_auto_completeopt = 1
set completeopt=menuone,noinsert,noselect,preview

" Cerrar automaticamente la ventana de vista previa cuando se completa
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" +++++
" Configuracion WINDSHIFT, movimiento de ventanas
lua << EOF
-- Lua
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    win_move_mode = {
      ["h"] = "left",
      ["j"] = "down",
      ["k"] = "up",
      ["l"] = "right",
      ["H"] = "far_left",
      ["J"] = "far_down",
      ["K"] = "far_up",
      ["L"] = "far_right",
      ["<left>"] = "left",
      ["<down>"] = "down",
      ["<up>"] = "up",
      ["<right>"] = "right",
      ["<S-left>"] = "far_left",
      ["<S-down>"] = "far_down",
      ["<S-up>"] = "far_up",
      ["<S-right>"] = "far_right",
    },
  },
  ---A function that should prompt the user to select a window.
  ---
  ---The window picker is used to select a window while swapping windows with
  ---`:WinShift swap`.
  ---@return integer? winid # Either the selected window ID, or `nil` to
  ---   indicate that the user cancelled / gave an invalid selection.
  window_picker = function()
    return require("winshift.lib").pick_window({
      -- A string of chars used as identifiers by the window picker.
      picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      filter_rules = {
        -- This table allows you to indicate to the window picker that a window
        -- should be ignored if its buffer matches any of the following criteria.
        cur_win = true, -- Filter out the current window
        floats = true,  -- Filter out floating windows
        filetype = {},  -- List of ignored file types
        buftype = {},   -- List of ignored buftypes
        bufname = {},   -- List of vim regex patterns matching ignored buffer names
      },
      ---A function used to filter the list of selectable windows.
      ---@param winids integer[] # The list of selectable window IDs.
      ---@return integer[] filtered # The filtered list of window IDs.
      filter_func = nil,
    })
  end,
})
EOF


" +++++
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


" +++++
" NERDTREE-GIT-PLUGIN
" https://github.com/Xuyuanp/nerdtree-git-plugin
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

" Configuración de simbolos (puede personalizarlos como desee,pero por defecto
" seran los siguientes ↑

" Instalación de NerdFonts
let g:NERDTreeGitStatusUseNerdFonts = 1
" Proyecto que parchea las fuentes especificas del desarrollador con una gran
" cantidad de iconos

" Mostrar el estado IGNORADO
let g:NERDTreeGitStatusShowIgnored = 0
" Valor por defecto = 0 (Reasignarlo en caso de ver lentitud en su ejecución o
" ejecución del editor

" Mostrar o indicar que archivo esta sin seguimiento en un directorio sin
" seguimiento
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" Valor por defecto = normal

" Mostrar indicador (clean) de limpieza
let g:NERDTreeGitStatusShowClean = 1
" Valor por defecto = 0


" +++++
" DEMAS CONFIGURACIONES (leer la descripcion de cada uno de ellos)
" Quitar resaltado de palabras despúes de hacer una busqueda
set nohlsearch

set wrap linebreak nolist
" wrap para vim

"  TWILIGHT
"  1) activar con : :TwiLightEnable, 
"  2) Alternar crepúsculo : :TwiLight 
"  3) Desactivar con : :TwiLightDisable

lua << EOF
  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


" +++++
" AIRLINE ( o BAR LINE)
" 1) staline
" 1.1) Configuracion
lua << EOF
require'staline'.setup {
	defaults = {
		fg = "#ffffff",
                bg = "none",
		cool_symbol = "", -- (  ArchLinux), ( ⊞ Windows), ( ⌘ ¿Mac?) 
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
			'-  spaVim  ',' ',
			'right_sep','%p%%',' ','right_sep',"❖","file_size",
		},
		mid  = {'mode','branch'},
		right= {
			'cool_symbol', ' ',
			'left_sep',' ', '%F',' ', '',
			'-line_column', ' ',
		},
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' '},
	},
}
EOF


set noshowmode
" Eliminar la linea de estado, que no es util cuando se tiene una status line

set ignorecase
" Ignorar las mayusculas y minusculas mientras se hace una busqueda

filetype plugin indent on
" Es una combinación tres comandos, los cuales activan la detección, el
" complemento y la sangría

set encoding=utf-8
" Abrir todos los archivos en utf-8

set number relativenumber
" Numeros de lineas relativos

set showmatch
" Muestra el parentesis o llave de cierre cuando el cursor esta sobre el
" parentesis o llave de apertura, y viceversa

set hidden
" Mostrar o activar los buferes ocultos

set backspace=indent,eol,start
" Corregir sangria de retroceso

syntax on

set wildmenu
" Finalizacion de la linea de comandos

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
" Realizar sincronización de resaltado de sintaxis desde el iniio a menor de
" 200 lineas


augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" Recordar la posición del cursor


"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread


"" Split
noremap <Leader>hh :<C-u>split<CR>
" Crear un split horizontal
noremap <Leader>vv :<C-u>vsplit<CR>
" Crear un split vertical

" Mapeos personalizados por mi
noremap <leader>w :w<cr>
" Guardar archivo reemplazando los dos puntos por el mapleader
noremap <leader>ii :w!<cr>
" Sobreescribir archivo reemplazando los dos puntos por el mapleader
noremap <leader>iq :wq<cr>
" Guardando y cerrando archivo reemplazando los dos puntos por el mapleader
noremap <leader>q :q<cr>
" Cerrando el archivo reemplazando los dos puntos por el mapleader
noremap <leader>qq :q!<cr>
" Forzar el cierre del archivo reemplazando los dos puntos por el mapleader

" Mapeo sobre cambios recientes
noremap <leader><Left> u<cr>
noremap <leader><Right> <C-r><cr>

" Mapeo plugInstall
noremap <leader>PP :PlugInstall<cr>
noremap <leader>PU :PlugUpdate<cr>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>

"" Tabs
nnoremap <Tab> gt
" Navegar entre las ventanas hacia adelante
nnoremap <S-Tab> gT
"Navegar entre las ventanas hacia atrás
nnoremap <silent> <S-t> :tabnew<CR>
" Crear un nueva ventana

nnoremap n nzzzv
" Navegar entre los resultados hacia adelante
nnoremap N Nzzzv
" Navegar entre los resultados hacia atrás

nnoremap <silent> <leader>tt :terminal<CR>
" Abrir terminal dentro de vim 

noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Buscar y abrir un archivo para editarlo desde vim/neovim

noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Buscar, ingresar y abrir carpetas para encontrar

" Sintaxis para python
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif


" +++++
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
" Abrir nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" +++++
" Movimiento de ventanas WINSHIFT
:nmap mm :WinShift


" +++++
" CAMBIAR DE MODO
:imap ii <Esc>


" +++++
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

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" CONFIGURACION FLOATERM
" https://github.com/voldikss/vim-floaterm
nnoremap <leader>tt :FloatermNew<cr>
" Abrir la terminal flotante

nnoremap <leader>ty :FloatermToggle<cr>
" Ocultar/reabrir la terminal flotante

nnoremap <leader>tp :FloatermNew python<cr>
" Abrir terminal con Python


" CONFIGURACION JEDI
" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" -------------------------------------------------------------------------
let g:startify_custom_header = [
  \ ' ███████╗██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗',
  \ ' ██╔════╝██╔══██╗██╔══██╗██║   ██║██║████╗ ████║',
  \ ' ███████╗██████╔╝███████║██║   ██║██║██╔████╔██║',
  \ ' ╚════██║██╔═══╝ ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  \ ' ███████║██║     ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║',
  \ ' ╚══════╝╚═╝     ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
  \ ' ▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪ https://github.com/yofreee',
  \]

let g:startify_fortune_use_unicode = 0

let g:startify_lists = [
     \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
     \ { 'header': ['   RECIENTES'],            'type': 'files' },
     \ ]                             
"    \ { 'header': ['   DIRECTORIO ACTUAL '. getcwd()], 'type': 'dir' },
nmap <c-n> :Startify <cr>
