local present, cmp = pcall(require, "cmp")

if not present then
   return
end

require("base46").load_highlight "cmp"

vim.opt.completeopt = "menuone,noselect"

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	copilot = "[CT]",
	path = "[Path]",
}

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
   local info = self:info_()
   info.scrollable = false
   return info
end

local options = {
   window = {
      completion = {
         border = border "CmpBorder",
         winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
         border = border "CmpDocBorder",
      },
   },
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
      format = function(entry, vim_item)
         local icons = require("nvchad_ui.icons").lspkind
         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
         if entry.source.name == 'cmp_tabnine' then
		 	vim_item.kind = ''
		 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
		 	  vim_item.kind = ' ' .. entry.completion_item.data.detail
		 	end
         end
         vim_item.menu = source_mapping[entry.source.name]
         return vim_item
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Insert,
         select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
   },
   sources = {
      { name = "copilot" },
      { name = "cmp_tabnine" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
   },
}

-- check for any override
options = require("core.utils").load_override(options, "hrsh7th/nvim-cmp")

cmp.setup(options)
