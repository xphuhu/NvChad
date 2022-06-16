local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config

  local servers = { "html", "cssls", "jsonls", "volar", "tsserver" }

  local nfattach = function(c, b)
    attach(c, b)
    c.resolved_capabilities.document_formatting = false
    c.resolved_capabilities.document_range_formatting = false
  end

  local gattach = function(c, b)
    attach(c, b)
    vim.api.nvim_buf_set_option(b, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    c.resolved_capabilities.document_formatting = true
    c.resolved_capabilities.document_range_formatting = true
    -- format on save
    vim.cmd([[
        augroup GO_LSP
          autocmd!
          autocmd BufWritePre <buffer> lua Goimports(1000)
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,1000)
        augroup END
      ]])
  end

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nfattach,
      capabilities = capabilities,
      -- root_dir = vim.loop.cwd,
    }
  end

  lspconfig.gopls.setup {
    on_attach = gattach,
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        gofumpt = true,
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      }
    }
  }

end

function Goimports(timeout_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

return M
