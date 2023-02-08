local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
local caps = vim.lsp.protocol.make_client_capabilities()

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require 'lspconfig'.intelephense.setup{}
require 'lspconfig'.phpactor.setup(
  {capabilities = caps}
)
