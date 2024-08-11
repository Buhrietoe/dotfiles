return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"go",
				"gomod",
				"gowork",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {
					cmd_env = {
						GOFLAGS = "-tags=integration",
					},
				},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			vim.list_extend(opts.sources, {
				nls.builtins.formatting.gofumpt,
				nls.builtins.diagnostics.golangci_lint,
			})
		end,
	},
	{
		"mason.nvim",
		opts = {
			ensure_installed = { "delve" },
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
		},
		opts = function(_, opts)
			opts.adapters = vim.list_extend(opts.adapters or {}, {
				require("neotest-go")({
					args = { "-tags=integration" },
				}),
			})
		end,
	},
}
