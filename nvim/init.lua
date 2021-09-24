-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
paq {'hoob3rt/lualine.nvim'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'kyazdani42/nvim-web-devicons', opt = true}
paq {'ojroques/nvim-lspfuzzy'}
paq {'liuchengxu/vim-which-key'}
paq {'lukas-reineke/indent-blankline.nvim'}
paq {'AckslD/nvim-whichkey-setup.lua'}
paq {'mfussenegger/nvim-dap'}
paq {'ggandor/lightspeed.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

-------------------- OPTIONS -------------------------------
g.mapleader = ' '
--cmd 'colorscheme desert'            -- Put your favorite colorscheme here
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
--opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
--opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap

-------------------- MAPPINGS ------------------------------
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode

-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-------------------- LSP -----------------------------------
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- We use the default settings for ccls and pylsp: the option table can stay empty
lsp.ccls.setup {}
--lsp.pylsp.setup {}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list
require'lspconfig'.pyright.setup{}

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-------------------- COMMANDS ------------------------------
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode

-------------------- WHICHKEY ------------------------------
local wk = require('whichkey_setup')

local keymap = {
    
    w = {':w!<CR>', 'save file'}, -- set a single command and text
    j = 'split args', -- only set a text for an already configured keymap
    ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
    f = { -- set a nested structure
        name = '+find',
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'},
        },
        q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
        g = {
            name = '+git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
        },
    }
}

wk.register_keymap('leader', keymap)


-------------------- TELESCOPE ----------------------------
map('n', '<leader>;f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>;g', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>;b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>;h', '<cmd>Telescope help_tags<cr>')

-------------------- LUALINE ------------------------------
local lualine = require 'lualine'
lualine.setup { options=
	{ 
		theme = 'nord' 
	}
}


-------------------- Lightspeed ---------------------------
local lightspeed = require 'lightspeed'
lightspeed.setup {
  jump_to_first_match = true,
  jump_on_partial_input_safety_timeout = 400,
  -- This can get _really_ slow if the window has a lot of content,
  -- turn it on only if your machine can always cope with it.
  highlight_unique_chars = false,
  grey_out_search_area = true,
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 5,
  x_mode_prefix_key = '<c-x>',
  -- Characters to be substituted in the highlighted matches.
  substitute_chars = { ['\r'] = '¬' },
  -- For instant-repeat, pressing the trigger key again (f/F/t/T)
  -- always works, but here you can specify additional keys too.
  instant_repeat_fwd_key = nil,
  instant_repeat_bwd_key = nil,
  -- By default, the values of these will be decided at runtime,
  -- based on `jump_to_first_match`.
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,
}

-------------------- Indent Blank --------------------------
local indent_blankline = require 'indent_blankline'
indent_blankline.setup {
	char = "⋅",
}

-------------------- BufferLine -----------------------------
local bufferline = require 'bufferline'
bufferline.setup {
	
}
map('n', '<silent>[b', '<cmd>BufferLineCycleNext<cr>')
map('n', '<silent>b]', '<cmd>BufferLineCycleNext<cr>')

-------------------- NvimTree -------------------------------
map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
