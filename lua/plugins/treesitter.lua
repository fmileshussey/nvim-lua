return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = { "c", "lua", "vim", "vimdoc", "typescript", "tsx", "javascript", "html", "json" }

		-- main-branch API: install() replaces master's ensure_installed/auto_install
		-- (which setup() silently ignores on this branch).
		require("nvim-treesitter").install(parsers)

		-- main does not enable highlighting, and core only auto-starts a few
		-- filetypes (lua, help). Start treesitter for any buffer whose language
		-- has an installed parser.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				if vim.treesitter.highlighter.active[ev.buf] then return end
				local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
				if lang and vim.treesitter.language.add(lang) then
					vim.treesitter.start(ev.buf, lang)
				end
			end,
		})
	end,
}
