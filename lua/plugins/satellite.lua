return {
	'lewis6991/satellite.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		handlers = {
			gitsigns = { enable = true },
			diagnostic = { enable = true },
			search = { enable = true },
			cursor = { enable = true },
			marks = { enable = true },
		},
	},
}
