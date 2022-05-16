return {
  ["hrsh7th/nvim-cmp"] = {
     config = function()
        require "custom.plugins.cmp"
     end,
  },
  ["goolord/alpha-nvim"] = {
         disable = false,
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
                 snippet_placeholder = '$$';
          })
      end,
  },
  ["jose-elias-alvarez/null-ls.nvim"]={
   
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
}
