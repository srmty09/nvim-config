local M = {}

function M.open_term_in_file_dir()
  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then
    vim.cmd('belowright split | terminal')
    return
  end
  local dir = vim.fn.fnamemodify(file, ':p:h')
  vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
  vim.cmd('belowright split | terminal')
end

return M 