return {
	'nvim-telescope/telescope.nvim',
	branch = 'master',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local previewers = require("telescope.previewers")
		local from_entry = require("telescope.from_entry")

		local image_exts = { png=true, jpg=true, jpeg=true, gif=true, webp=true, svg=true, ico=true, bmp=true }

		local file_previewer = previewers.new_termopen_previewer({
			get_command = function(entry)
				local path = from_entry.path(entry, false)
				if not path then return end
				local ext = path:match("%.(%w+)$")
				if ext and image_exts[ext:lower()] then
					return { "chafa", path }
				end
				if vim.fn.executable("bat") == 1 then
					return { "bat", "--style=plain", "--color=always", path }
				end
				return { "cat", path }
			end,
		})

		require("telescope").setup({
			defaults = {
				dynamic_preview_title = true,
				winblend = 10,
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					prompt_position = "top",
					height = 0.95,
				},
				file_previewer = file_previewer,
			},
		})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
				file_ignore_patterns = { "%.git/", "node_modules/" },
			})
		end, { desc = 'Find files (incl. hidden & ignored)' })
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })
		vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Live grep' })
		vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Find references' })
		vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'Find references' })
		vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, { desc = 'Find workspace symbols' })
		vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find document symbols' })
	end,
}
