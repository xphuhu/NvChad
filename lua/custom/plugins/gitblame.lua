local present, _ = pcall(require, "gitblame")

if not present then
  return
end

vim.g.gitblame_enabled = 0
vim.g.gitblame_display_virtual_text = 1
