return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,   -- Lua formatter
                null_ls.builtins.diagnostics.rubocop, -- Ruby linter
                null_ls.builtins.formatting.rubocop,  -- Ruby formatter
				null_ls.builtins.formatting.prettier, -- JS formatter
				-- null_ls.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
