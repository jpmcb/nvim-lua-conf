-- Attribution: https://github.com/folke/lazy.nvim/discussions/1167

local telescope = require("telescope.builtin")

local spec = {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
	},
	{
		"gruvbox-community/gruvbox",
		name = "gruvbox",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
}

vim.keymap.set("n", "<leader>uu", function() --> Show all custom colors in telescope...
	for _, color in ipairs(spec) do --> Load all colors in spec....
		print(color.name)
		vim.cmd("Lazy load " .. color.name) --> vim colorschemes cannot be required...
	end

	vim.schedule(function() --> Needs to be scheduled:
		local builtins = {
			"zellner",
			"torte",
			"slate",
			"shine",
			"ron",
			"quiet",
			"peachpuff",
			"pablo",
			"murphy",
			"lunaperche",
			"koehler",
			"industry",
			"evening",
			"elflord",
			"desert",
			"delek",
			"default",
			"darkblue",
			"blue",
		}

		local completion = vim.fn.getcompletion

		---@diagnostic disable-next-line: duplicate-set-field
		vim.fn.getcompletion = function() --> override
			return vim.tbl_filter(function(color)
				return not vim.tbl_contains(builtins, color) --
			end, completion("", "color"))
		end

		telescope.colorscheme()
		vim.fn.getcompletion = completion --> restore
	end)
end, { desc = "Telescope custom colors", silent = true })

vim.cmd([[colorscheme tokyonight-night]])
