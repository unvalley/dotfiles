vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}
end)
