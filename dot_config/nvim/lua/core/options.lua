local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

opt.laststatus = 3 -- global statusline
opt.statusline = config.ui.statusline.config
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Indenting
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.mouse = "a"

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- command
opt.wildmenu = true
opt.wildmode = "longest, list, full"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 500
opt.updatetime = 2000
opt.jumpoptions = "stack"

-- beap sound
opt.errorbells = false
opt.visualbell = false

-- file
opt.autoread = true
opt.undofile = true
opt.swapfile = false
opt.backup = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some builtin vim plugins
local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end

local default_providers = {
   "node",
   "perl",
   "python3",
   "ruby",
}

for _, provider in ipairs(default_providers) do
   vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- set shada path
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)

-- load user options
config.options.user()
