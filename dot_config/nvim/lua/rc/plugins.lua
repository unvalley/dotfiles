vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}

	use {'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons', -- optional, for file icon},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
}
end)
