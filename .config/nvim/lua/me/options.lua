-- :help options
local options = {
    
  -- Response behaviour
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in ms)
  updatetime = 300,                         -- faster completion (4000ms default)

  mouse = "a",                             -- allow the mouse to be used in neovim

  -- Visuals
  cmdheight = 1,                            -- command line height in lines
  showmode = false,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                          -- enter the world of tabs only if there are at least 2 tab pages

  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window

  termguicolors = true,                     -- set better colours (most terminals support this)

  -- Files
  writebackup = false,                      -- do not use Vim's backup method, ...
  backup = false,                           -- use git instead
  swapfile = false,                         -- trust my OS to not crash,...
  undofile = true,                          -- use persistent undo instead

  fileencoding = "utf-8",                   -- default sensible standard for current buffer

  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard

  -- Navigation of text
  cursorline = true,                        -- highlight the current line

  scrolloff = 5,                            -- always show some vertical context around cursor
  wrap = true,                              -- display lines as one long line,...
  sidescrolloff = 5,                        -- and if not, show some horizontal context around cursor

  number = true,                            -- set numbered lines
  relativenumber = false,                   -- set relative numbered lines
  numberwidth = 4,                          -- line number width (in columns)
  signcolumn = "yes",                       -- always show the sign column, don't shift based on content

  hlsearch = true,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search patterns,...
  smartcase = true,                         -- unless we explicitly use capitals,...
  tagcase = 'followscs',                    -- and the same behaviour for tag searches

  completeopt = { "menuone", "noselect" },  -- insert mode completion options
  pumheight = 10,                           -- pop up menu height

  -- Text itself
  smartindent = true,                       -- set up sane indenting strategies by default
  autoindent = true,                        -- recommended if smartindent is true

  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- the number of spaces inserted for each indentation
  tabstop = 2,                              -- insert 2 spaces for a tab
  smarttab = false,                         -- insert spaces based on tabstop

  spelllang = "en_gb"
}

-- THINGS TO SET BY FILETYPE
-- conceallevel = 0,                        -- so that `` is visible in markdown files

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Misc additional options
vim.opt.iskeyword:append "-"
