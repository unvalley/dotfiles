local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd[[command! PackerInstall packadd packer.nvim | lua require'packers'.install()]]
vim.cmd[[command! PackerUpdate packadd packer.nvim | lua require'packers'.update()]]
vim.cmd[[command! PackerSync packadd packer.nvim | lua require'packers'.sync()]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require'packers'.clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()]]

local startup = require("packer").startup(function()
    -- package manager
	use {"wbthomason/packer.nvim"}
	-- lsp
	use {"williamboman/nvim-lsp-installer"}
	use {"neovim/nvim-lspconfig"}
	-- cmp
	use {"hrsh7th/nvim-cmp"}
	use {"hrsh7th/cmp-nvim-lsp"}
	use {"hrsh7th/cmp-vsnip"}
	use {"hrsh7th/cmp-buffer"}
	use {"hrsh7th/vim-vsnip"}
	-- formatter
	use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

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
	use {"rhysd/clever-f.vim"}
    -- surround
    use {"tpope/vim-surround", opt =true}
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

local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"
lsp_installer.setup()
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
    on_attach = on_attach,
  }
end

vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require"cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})

-- formatter
local null_ls = require "null-ls"
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
  },
}

-- client.resolved_capabilities.document_formatting = false

return startup
