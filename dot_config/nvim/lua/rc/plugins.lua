local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd[[command! PackerInstall packadd packer.nvim | lua require'packers'.install()]]
vim.cmd[[command! PackerUpdate packadd packer.nvim | lua require'packers'.update()]]
vim.cmd[[command! PackerSync packadd packer.nvim | lua require'packers'.sync()]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require'packers'.clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()]]

return require("packer").startup(function()
    -- package manager
	use {"wbthomason/packer.nvim"}
    -- filer
    use {"lambdalisue/fern.vim"}
    -- icon
    use {"kyazdani42/nvim-web-devicons"}
    -- comment
    use {"terrortylor/nvim-comment"}
    require("nvim_comment").setup()
    -- motion
    use {"yuki-yano/fuzzy-motion.vim",
        requires = {'vim-denops/denops.vim', opt = true}
    }
    -- surround
    use {"tpope/vim-surround"}
    -- git
	use {'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}
    -- status bar
    -- TODO: setting colors
    use {'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require("rc/plugin-config/lualine")
		end,
    }
    -- fuzzy finder
    use {'ibhagwan/fzf-lua'}
    -- pairs
    use {"windwp/nvim-autopairs"}
    require("nvim-autopairs").setup()
    
    if packer_bootstrap then
        require('packer').sync()
    end
end)
