local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("WARNING: treesitter not found!")
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'powerline_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    padding = 1
  },
  sections = {
    lualine_a = {
      { 'mode', fmt =  function(str) return str:sub(1, 1) end },
      -- TODO: fix
      -- { 'S', cond = function() return vim.api.nvim_get_option_value('spell',{}) end }
    },
    lualine_b = {
        { 'branch', icon = '' },
        { 'diff', 
          symbols = {added = '+', modified = '~', removed = '-'} 
        },
        { 'diagnostics', 

          sources = { 'nvim_lsp' },
    
          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },
    
          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
          },
          symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        },
    },
    lualine_c = {
      { 'filename', path = 1 }
    },
    lualine_x = {
        'encoding', 
        'fileformat', 
        'filetype', 
    },
    lualine_y = {'progress', 'filesize' },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      'filename'
    },
    lualine_x = {
      'location'
    },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
