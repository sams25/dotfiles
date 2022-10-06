local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("WARNING! lspconfig failed")
  return
end

local servers = {
  'clangd',
  'sumneko_lua',
  'pylsp',
  'r_language_server',
  'texlab',
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("me.lsp.handlers").on_attach,
    capabilities = require("me.lsp.handlers").capabilities
  }

  local has_custom_opts, server_custom_opts = pcall(require, "me.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[server].setup(opts)
end
