local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("WARNING: treesitter not found!")
  return
end

-- configs.setup({
--   ensure_installed = "all",
--   sync_install = false,
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false
--   }
-- })
