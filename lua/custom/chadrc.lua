-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme_toggle = { "one_light", "onedark" },
  theme = "one_light",
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
    ["williamboman/mason.nvim"] = pluginConfs.lspinstall,
    ["NvChad/nvterm"] = pluginConfs.nvterm,
    ["lukas-reineke/indent-blankline.nvim"] = pluginConfs.indentblankline,
  },
}

M.mappings = require "custom.mappings"

return M
