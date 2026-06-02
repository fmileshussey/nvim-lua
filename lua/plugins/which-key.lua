return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		-- Popup appears after this many ms of holding a prefix (e.g. <leader>)
		delay = 300,
	},
	keys = {
		{
			'<leader>wk',
			function() require('which-key').show({ global = false }) end,
			desc = 'Show buffer-local keymaps (which-key)',
		},
	},
}
