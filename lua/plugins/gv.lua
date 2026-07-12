return {
	'junegunn/gv.vim',
	dependencies = { 'tpope/vim-fugitive' },
	cmd = 'GV',
	keys = {
		{ '<leader>gl', '<cmd>GV<cr>', desc = 'Git log (all branches)' },
		{ '<leader>gL', '<cmd>GV!<cr>', desc = 'Git log (current file)' },
	}
}
