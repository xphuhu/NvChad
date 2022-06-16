local M = {}

M.lspinstall = {
  ensure_installed = {
    "lua",
    "gopls",
  },
}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "go",
    "gomod",
    "gowork",
    "json",
    "graphql",
    "yaml",
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
      },
    },
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
}

return M
