vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><C-L><Esc>", { noremap = true, silent = true })

-- fern
vim.keymap.set("n", "<Leader>fd", ":Fern %:h<CR>")

-- fzf-lua
vim.keymap.set("n", "<Leader>ag", require("fzf-lua").grep_cword)
vim.keymap.set("n", "<Leader>b", require("fzf-lua").buffers)
vim.keymap.set("n", "<Leader>fr", require("fzf-lua").oldfiles)
vim.keymap.set("n", "<Leader>ga", require("fzf-lua").git_files)
vim.keymap.set("n", "<Leader>gg", require("fzf-lua").live_grep)
vim.keymap.set("n", "<Leader>gl", require("fzf-lua").git_bcommits)
vim.keymap.set("n", "<Leader>gs", require("fzf-lua").git_status)
vim.keymap.set("n", "<Leader><Space>", require("fzf-lua").command_history)
vim.keymap.set("n", "<Leader>x", require("fzf-lua").commands)

-- fuzzy-motion.vim
vim.keymap.set("n", "<Leader>f", "<Cmd>FuzzyMotion<CR>", { noremap = true, silent = true })