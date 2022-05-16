return {
  general = {
    n = {
      -- save
      ["<leader>w"] = { "<cmd> w <CR>", "﬚  save file" },
      ["<leader>q"] = { "<cmd> q <CR>", "  exit" },
    },
  },
  packer = {
     n = {
        ["<leader>p"] = {"","Packer"},
        ["<leader>pc"] = { "<cmd>PackerCompile<cr>", "Compile" },
        ["<leader>pi"] = { "<cmd>PackerInstall<cr>", "Install" },
        ["<leader>pr"] = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
        ["<leader>pS"] = { "<cmd>PackerSync<cr>", "Sync" },
        ["<leader>ps"] = { "<cmd>PackerStatus<cr>", "Status" },
        ["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Update" },
     },
  },
  telescope = {
     n = {
        ["<leader>s"] = {"","Telescope"},
        -- find
        ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
        ["<leader>sw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>sk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
        ["<leader>sm"] = { "<cmd> Telescope marks <CR>", "show marks" },
        ["<leader>sc"] = { "<cmd> Telescope commands <CR>", "show commands" },
        -- git
        ["<leader>sg"] = { "", "gits" },
        ["<leader>sgc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>sgt"] = { "<cmd> Telescope git_status <CR>", "git status" },
        ["<leader>st"] = { "", "themes" },
        ["<leader>stm"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
        -- theme ssitcher
        ["<leader>sth"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },

     },
  },
  lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

     n = {
        ["<leader>l"] = {"","LSP"},
        ["gD"] = {
           function()
              vim.lsp.buf.declaration()
           end,
           "   lsp declaration",
        },
        ["gd"] = {
           function()
              vim.lsp.buf.definition()
           end,
           "   lsp definition",
        },
        ["gr"] = {
           function()
              vim.lsp.buf.references()
           end,
           "   lsp references",
        },
        ["[d"] = {
           function()
              vim.diagnostic.goto_prev()
           end,
           "   goto prev",
        },
        ["]d"] = {
           function()
              vim.diagnostic.goto_next()
           end,
           "   goto_next",
        },
        ["K"] = {
           function()
              vim.lsp.buf.hover()
           end,
           "   lsp hover",
        },
        ["gi"] = {
           function()
              vim.lsp.buf.implementation()
           end,
           "   lsp implementation",
        },
        ["<leader>ls"] = {
           function()
              vim.lsp.buf.signature_help()
           end,
           "   lsp signature_help",
        },
        ["<leader>ld"] = {
          "<cmd>lua require'telescope.builtin'.diagnostics{bufnr=0}<cr>",
          "Document Diagnostics",
        },
        ["<leader>lr"] = {
           function()
              vim.lsp.buf.rename()
           end,
           "   lsp rename",
        },
        ["<leader>lR"] = { "<cmd> LspRestart <CR>", "Restart LSP" },
        ["<leader>lc"] = {
          "<cmd>lua require'telescope.builtin'.lsp_code_actions{}<cr>",
          "Code Action",
        },
        ["<leader>lf"] = {
           function()
              vim.lsp.buf.formatting()
           end,
           "   lsp formatting",
        },
        ["<leader>lw"] = {"","workspaces"},
        ["<leader>lwa"] = {
           function()
              vim.lsp.buf.add_workspace_folder()
           end,
           "   add workspace folder",
        },
        ["<leader>lwr"] = {
           function()
              vim.lsp.buf.remove_workspace_folder()
           end,
           "   remove workspace folder",
        },
        ["<leader>lwl"] = {
           function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
           end,
           "   list workspace folders",
        },
        ["<leader>lp"] = { "", "Peek" },
        ["<leader>lpd"] = {
          "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>",
          "Definition",
        },
        ["<leader>lpt"] = {
          "<cmd>lua require'telescope.builtin'.lsp_type_definitions{}<cr>",
          "Type Definition",
        },
        ["<leader>lpi"] = {
          "<cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>",
          "Implementation",
        },
        ["<leader>lpr"] = {
          "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>",
          "References",
        },
     },
  },
}
