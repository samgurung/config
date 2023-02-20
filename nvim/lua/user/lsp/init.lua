local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
-- require 'lspconfig'.phpactor.setup{
--   init_options = {
--         ["language_server_phpstan.enabled"] = true,
--         ["language_server_psalm.enabled"] = false,
--     },
--   capabilities = capabilities,
--   diagnostic = {
--     enable = true,
--   },
-- }
require 'lspconfig'.intelephense.setup{
 settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "Core",
                "curl",
                "date",
                "dom",
                "fileinfo",
                "filter",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "libxml",
                "laravel",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "regex",
                "session",
                "SimpleXML",
                "sockets",
                "sodium",
                "standard",
                "superglobals",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                "wordpress-stubs",
                "woocommerce-stubs",
                "acf-pro-stubs",
                "wordpress-globals",
                "wp-cli-stubs",
                "genesis-stubs",
                "polylang-stubs"
            },
            diagnostic ={
              enable = true,
            },

            files = {
                maxSize = 5000000;
            };
        };
    },
    capabilities = capabilities,
}
vim.diagnostic.config({
    virtual_text = false, -- Do not show the text in front of the error
    float = {
        border = "rounded",
    },
})
