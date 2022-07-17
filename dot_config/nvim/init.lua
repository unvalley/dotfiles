require "core"
require "core.options"

if vim.g.vscode then
    return
end

vim.defer_fn(function()
    require("core.utils").load_mappings()
end, 0)

vim.lsp.set_log_level("debug")

-- setup packer + plugins
require("core.packer").bootstrap()
require "plugins"

pcall(require, "custom")
