-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim' },
  { 'goolord/alpha-nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'folke/which-key.nvim' },
  { 'p00f/nvim-ts-rainbow' },
  { 'nvim-telescope/telescope-file-browser.nvim', dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' } },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'Pocco81/auto-save.nvim' },
  { 'karb94/neoscroll.nvim' },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'xiyaowong/transparent.nvim' },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  { 'GCBallesteros/jupytext.nvim' },
  { 'benlubas/molten-nvim', build = ':UpdateRemotePlugins' },
})

-- nvim-tree setup: always open on startup
require('nvim-tree').setup({
  view = {
    width = 30,
    side = 'left',
    preserve_window_proportions = true,
  },
  renderer = {
    highlight_git = true,
    icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
  },
  filters = { dotfiles = false },
  git = { enable = true },
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Only open nvim-tree if Neovim is started with files or directories
    if #vim.fn.argv() > 0 then
      require('nvim-tree.api').tree.open()
    end
  end
})

-- lualine setup: minimal statusline
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '',
    globalstatus = true,
  },
}

-- catppuccin colorscheme setup
vim.cmd.colorscheme('catppuccin')

-- telescope setup
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    }
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
}

-- Load the file_browser extension
pcall(function() require('telescope').load_extension('file_browser') end)

-- which-key setup
require('which-key').setup{}

-- treesitter rainbow parentheses setup
local ts_ok, ts = pcall(require, 'nvim-treesitter.configs')
if ts_ok then
  ts.setup {
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
  }
end

-- bufferline setup for tab-like buffer management
require('bufferline').setup{
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}

-- Keymaps for tab switching
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Window navigation with <Space>+arrow keys
vim.api.nvim_set_keymap('n', '<Space><Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><Right>', '<C-w>l', { noremap = true, silent = true })

-- Map <Tab><Enter> to open a terminal in the directory of the current file
vim.api.nvim_set_keymap('n', '<Tab><CR>', [[:lua require('user.open_term_in_file_dir').open_term_in_file_dir()<CR>]], { noremap = true, silent = true })

-- auto-save setup
require('auto-save').setup {
  trigger_events = {"InsertLeave", "FocusLost"}
}

-- neoscroll setup
require('neoscroll').setup{}

-- indent-blankline setup
require('ibl').setup{}

-- transparent setup
require('transparent').setup({
  enable = true,
  extra_groups = {
    "NormalFloat", "NvimTreeNormal", "NvimTreeNormalNC", "NormalNC", "TelescopeNormal", "TelescopeBorder"
  }
})

-- Set all main UI backgrounds to pure black for a pure black theme
vim.cmd('highlight Normal guibg=#000000')
vim.cmd('highlight NormalNC guibg=#000000')
vim.cmd('highlight NvimTreeNormal guibg=#000000')
vim.cmd('highlight NvimTreeNormalNC guibg=#000000')
vim.cmd('highlight TelescopePromptNormal guibg=#000000')
vim.cmd('highlight TelescopeNormal guibg=#000000')
vim.cmd('highlight TelescopeBorder guibg=#000000')
vim.cmd('highlight StatusLine guibg=#000000')
vim.cmd('highlight VertSplit guibg=#000000')
vim.cmd('highlight LineNr guibg=#000000')
vim.cmd('highlight SignColumn guibg=#000000')

-- Map <Space>s to open Telescope file_browser for interactive directory navigation
vim.api.nvim_set_keymap('n', '<Space>s', ":lua require('telescope').extensions.file_browser.file_browser({ hidden = true, grouped = true, respect_gitignore = false, select_buffer = true })<CR>", { noremap = true, silent = true })
-- Map <Space>g to open Telescope live_grep for code search
vim.api.nvim_set_keymap('n', '<Space>g', ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })

-- toggleterm setup for floating terminals
require('toggleterm').setup{
  direction = 'float',
  float_opts = {
    border = 'curved',
    winblend = 3,
  },
}

-- Function to open a new floating terminal in the current file's directory for each tab
function _OpenNewFloatTermInFileDirPerTab()
  local file = vim.api.nvim_buf_get_name(0)
  if file ~= '' then
    local dir = vim.fn.fnamemodify(file, ':p:h')
    vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
  end
  -- Open a new terminal buffer in a float
  vim.cmd('ToggleTerm direction=float')
  -- Set <Esc> in terminal mode to close the terminal buffer
  vim.cmd([[tnoremap <buffer> <Esc> <C-\><C-n>:bd!<CR>]])
end
vim.api.nvim_set_keymap('n', '<Space>t', ':lua _OpenNewFloatTermInFileDirPerTab()<CR>', { noremap = true, silent = true })

-- Map <Esc> in terminal mode to close the floating terminal for the current tab
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>:lua require('toggleterm').toggle(vim.api.nvim_get_current_tabpage(), nil, nil, 'float')<CR>]], { noremap = true, silent = true })

-- jupytext.nvim setup for .ipynb editing
require('jupytext').setup{}

-- molten-nvim setup for interactive code cells (Python)
vim.g.molten_output_win_max_height = 20
vim.g.molten_virt_text_output = true
vim.g.molten_image_provider = 'ueberzug' 