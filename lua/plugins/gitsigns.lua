return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		current_line_blame_opts = {
			delay = 300,
			ignore_whitespace = false,
		},
		on_attach = function(bufnr)
			local gs = require('gitsigns')
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation between hunks
			map('n', ']c', function() gs.nav_hunk('next') end, 'Next git hunk')
			map('n', '[c', function() gs.nav_hunk('prev') end, 'Prev git hunk')

			-- Actions
			map('n', '<leader>gb', gs.toggle_current_line_blame, 'Toggle line blame')
			map('n', '<leader>gp', gs.preview_hunk, 'Preview hunk')
			map('n', '<leader>gr', gs.reset_hunk, 'Reset hunk')
			map('n', '<leader>gB', function() gs.blame_line({ full = true }) end, 'Blame line (full)')
		end,
	},
}
