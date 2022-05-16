-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function()
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
--    vim.opt.mouse = ''
  end,
}

M.ui = {
   theme_toggle = { "one_light","onedark"},
   theme = "wombat",
}

-- Install plugins
local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs" -- path to table

-- NvChad included plugin options & overrides
M.plugins = {
   user = userPlugins,
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["williamboman/nvim-lsp-installer"] = pluginConfs.lspinstall,
      ["NvChad/nvterm"] = pluginConfs.nvterm,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfigs", -- path of file containing setups of different lsps
      },
   },
}

M.mappings = require "custom.mappings"

return M
