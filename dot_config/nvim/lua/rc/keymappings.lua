vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><C-L><Esc>", { noremap = true, silent = true })

-- fern
vim.keymap.set("n", "<Leader>fn", ":Fern . -reveal=% -drawer -toggle -width=30<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fd", ":Fern . -drawer<CR>")

-- fzf-lua
vim.keymap.set("n", "<Leader>ag", "<Cmd>lua require('fzf-lua').files()<CR>")
vim.keymap.set("n", "<Leader>b", "<Cmd>lua require('fzf-lua').buffers()<CR>")
vim.keymap.set("n", "<Leader>fr", "<Cmd>lua require('fzf-lua').oldfiles()<CR>")
vim.keymap.set("n", "<Leader>ga", "<Cmd>lua require('fzf-lua').git_files()<CR>")
vim.keymap.set("n", "<Leader>gg", "<Cmd>lua require('fzf-lua').live_grep()<CR>")
vim.keymap.set("n", "<Leader>gl", "<Cmd>lua require('fzf-lua').git_bcommits()<CR>")
vim.keymap.set("n", "<Leader>gs", "<Cmd>lua require('fzf-lua').git_status()<CR>")
vim.keymap.set("n", "<Leader><Space>", "<Cmd>lua require('fzf-lua').command_history()<CR>")
vim.keymap.set("n", "<Leader>x", "<Cmd>lua require('fzf-lua').commands()<CR>")
vim.keymap.set("n", "<Leader>km", "<Cmd>lua require('fzf-lua').keymaps()<CR>")
--
vim.keymap.set("n", "<Leader>gg", require("fzf-lua").live_grep)
vim.keymap.set("n", "<Leader>gl", require("fzf-lua").git_bcommits)
vim.keymap.set("n", "<Leader>gs", require("fzf-lua").git_status)
vim.keymap.set("n", "<Leader><Space>", require("fzf-lua").command_history)
vim.keymap.set("n", "<Leader>x", require("fzf-lua").commands)
vim.keymap.set("n", "<Leader>km", require("fzf-lua").keymaps)

-- fuzzy-motion.vim
vim.keymap.set("n", "<Leader>f", "<Cmd>FuzzyMotion<CR>", { noremap = true, silent = true })
