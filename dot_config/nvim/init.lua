require("rc/base")
require("rc/plugins")
require("rc/keymappings")

-- omit install and compile when setting plugins
-- vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- im-select setting for Japanese
-- autocmd InsertLeave * :silent !/usr/local/bin/im-select com.google.inputmethod.Japanese.Roman
