require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'python' },
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")
      return ft == "terminal" or ft == "TelescopePrompt" or ft == "NvimTree"
    end,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
} 