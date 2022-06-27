vim.cmd([[ "language " .. os.getenv("LANG") ]])
vim.o.langmenu = os.getenv("LANG")

vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.o.shell="/bin/fish"
vim.o.filetype = true
vim.o.number = true
vim.o.ruler = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth=4
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.autoindent = true

-- restore cursor place when open a file
vim.api.nvim_create_autocmd({"BufReadPost"}, {
    pattern = {"*"},
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- shouldn't require plugins that not adapted to VSCode NeoVim
-- if vim.g.vscode then return nil end

