require("rc/base")
require("rc/plugins")
require("rc/keymappings")

-- omit install and compile when setting plugins
vim.cmd[[autocmd BufWritePost /lua/rc/plugins.lua PackerCompile]]

-- im-select setting for Japanese
vim.cmd[[autocmd InsertLeave * :silent !/usr/local/bin/im-select com.google.inputmethod.Japanese.Roman]]
