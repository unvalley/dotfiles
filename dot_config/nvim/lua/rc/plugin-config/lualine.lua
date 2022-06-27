require('lualine').setup {
	options = {
		icons_enabled = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { 'g:coc_status', 'bo:filetype' }
	}
}
