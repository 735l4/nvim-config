-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "eslint", "tsserver"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.phpactor.setup {
  on_attach = on_attach,
  filetypes = {"php", "blade"},
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  }
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
  filetypes = {"php", "blade"},
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
        "hash",
        "iconv",
        "json",
        "libxml",
        "mbstring",
        "mcrypt",
        "openssl",
        "pcre",
        "PDO",
        "phar",
        "readline",
        "Reflection",
        "session",
        "SimpleXML",
        "sodium",
        "standard",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlwriter",
        "zip",
        "zlib",
        "laravel"
      }
    }
  }
}

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capapabilities = capabilities,
  on_init = on_init,
  filetypes = {"css", "html", "php", "typescriptreact", "twig", "blade"}
})


lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"}
})
