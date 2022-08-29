return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfigs"
    end,
  },
  ["goolord/alpha-nvim"] = {
         disable = false,
  },
  ["hrsh7th/nvim-cmp"] = {
     config = function()
        require "custom.plugins.cmp"
     end,
  },
  ["zbirenbaum/copilot.lua"] = {
    event = "VimEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    module = { "copilot_cmp"},
    requires = 'hrsh7th/nvim-cmp',
    after = "nvim-cmp", -- Here
  },
  ["tzachar/cmp-tabnine"] = {
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp',
      after = "nvim-cmp", -- Here
      config = function()
          local tabnine = require('cmp_tabnine.config')
          tabnine:setup({
                 max_lines = 1000;
                 max_num_results = 20;
                 sort = true;
                 run_on_every_keystroke = true;
                 snippet_placeholder = '..';
          })
      end,
  },
  ["jose-elias-alvarez/null-ls.nvim"]={
      disable = true,
      after = "nvim-lspconfig",
      config = function()
          require("custom.plugins.null-ls").setup()
      end,
  },
  ["ethanholz/nvim-lastplace"]={
      
      config = function()
          require("nvim-lastplace").setup {}
      end,
      event = "BufWinEnter",
  },
  ["phaazon/hop.nvim"]={
      
      event = "BufRead",
      config = function()
          require("custom.plugins.hop").setup()
      end,
  },
  -- Debugging
  ["mfussenegger/nvim-dap"]={
      
      -- event = "BufWinEnter",
      config = function()
          require("custom.plugins.dap").setup()
      end,
  },

  -- Debugger management
  ["Pocco81/DAPInstall.nvim"] = {
      commit = "24923c3819a450a772bb8f675926d530e829665f",
      -- event = "BufWinEnter",
      -- event = "BufRead",
      config = function()
          require("custom.plugins.dap-install").setup()
      end,
  },
  ["rcarriga/nvim-dap-ui"]={
      config = function()
          require("dapui").setup()
      end,
      ft = { "go" },
      requires = { "mfussenegger/nvim-dap" },
  },
  ["mbbill/undotree"]={},
  ["mg979/vim-visual-multi"]={},

  ["folke/which-key.nvim"] = {disable = false},
  ["f-person/git-blame.nvim"] = {
    config = function()
      require("plugins.configs.others").gitblame()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
  },

}
