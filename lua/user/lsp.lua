local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
  nmap('gr', vim.lsp.buf.references, 'References')
end

lspconfig.pyright.setup {
  on_attach = on_attach,
}
lspconfig.clangd.setup {
  on_attach = on_attach,
} 