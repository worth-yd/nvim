return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10, -- Default size for non-floating terminals
			open_mapping = [[<leader>te]], -- Key binding to toggle terminal (Ctrl + \)
			hide_numbers = true, -- Hide line numbers in terminal
			shade_terminals = true, -- Apply shading to terminals
			start_in_insert = true, -- Start in insert mode when terminal opens
			persist_size = true, -- Persist terminal size across sessions
			direction = "float", -- Open terminal in floating window
			float_opts = {
				border = "curved", -- Choose 'single', 'double', 'shadow', 'curved'
				winblend = 20, -- Transparency of the floating window
			},
		})
	end,
}
