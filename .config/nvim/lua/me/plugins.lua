-- :help packpath for why it has to look like this
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- Autoinstall package manager
-- TODO: First time this happens, there's some awkward interaction with a window; fix
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  vim.notify('NOTE: Installing packer... close and reopen Neovim')
  vim.cmd([[packadd packer.nvim]])
end

-- Reload neovim whenever we update this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("WARNING: Packer not loaded, no guarantee on plugins!")
  return
end

-- Install your plugins here
return packer.startup(function(use)

  -- Base
  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins

  -- Navigation
  use { 'alexghergh/nvim-tmux-navigation', config = function()
    require 'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\",
      }
    }
  end
  }

  -- Visuals
  use { 'agude/vim-eldar' } -- Truly black background


  -- Completion plugins and their recommended additional packages
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-nvim-lsp" })

  -- Snippets
  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "rafamadriz/friendly-snippets" })

  -- LSP
  use({ "williamboman/mason.nvim" })
  use({ "neovim/nvim-lspconfig" })
  -- use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })

 -- Git
 use({ "lewis6991/gitsigns.nvim" })

  -- Maybe?
  -- use({ "nvim-treesitter/nvim-treesitter" })
  -- use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
  -- use({ "numToStr/Comment.nvim" })
  -- use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  -- use({ "kyazdani42/nvim-web-devicons" })
  -- use({ "kyazdani42/nvim-tree.lua" })
  -- use({ "akinsho/bufferline.nvim" })
  -- use({ "moll/vim-bbye" })
  -- use({ "nvim-lualine/lualine.nvim" })
  -- use({ "akinsho/toggleterm.nvim" })
  -- use({ "ahmedkhalf/project.nvim" })
  -- use({ "lewis6991/impatient.nvim" })
  -- use({ "lukas-reineke/indent-blankline.nvim" })
  -- use({ "goolord/alpha-nvim" })
  -- use("folke/which-key.nvim")


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
