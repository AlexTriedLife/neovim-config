require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls"}
})

local lspconfig = require("lspconfig")
local configs = require 'lspconfig/configs'

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)


lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.clangd.setup{
	filetypes = {'h','hpp','c','cpp','cxx'}
}

lspconfig.gopls.setup{}





