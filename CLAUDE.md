# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim). There is no build step or test suite — "running" this code means launching `nvim`.

## Working with the config

- Apply/install changes after editing plugin specs: `nvim --headless "+Lazy! sync" +qa`
- Verify a plugin loads without erroring: `nvim --headless "+lua require('<module>')" +qa`
- `:checkhealth` (inside nvim) — diagnose plugin/LSP issues
- `:Lazy` — plugin manager UI; `:Mason` — LSP server installer UI
- The plugin version lockfile is `lazy-lock.json`; it changes on sync and is committed.

## Load order & entry points

`init.lua` → `require("finn")` → `lua/finn/init.lua`, which loads in order:
1. `finn.remap` — global/native keymaps (leader is `Space`)
2. `finn.lazy` — bootstraps lazy.nvim and imports **all** of `lua/plugins/`
3. `finn.misc` — `vim.opt` editor settings

`lua/finn/init.lua` also defines a single `LspAttach` autocmd holding all buffer-local LSP keymaps (`gd`, `K`, `<leader>ca`, etc.). The leader key **must** stay set before `require("lazy").setup()` in `lazy.lua`, or plugin mappings bind wrong.

## Adding a plugin

Create one file in `lua/plugins/` that `return`s a lazy.nvim spec table. The `{ import = "plugins" }` line in `lazy.lua` picks it up automatically — no registration needed. Keep each plugin's own keymaps inside that spec's `config` function (see `telescope.lua`, `harpoon.lua`), **not** in `remap.lua`. `after/plugin/telescope.lua` is intentionally a stub — this repo migrated away from the `after/plugin/` pattern toward per-plugin spec files.

`README.md` documents the keymaps (grouped by area) and the plugin list — update it whenever you add/remove a plugin or change a user-facing keybinding.

## Keymap ownership (conflict hazard)

Keymaps live in three distinct places. Before adding any binding, grep all three for the key — conflicts here are silent and easy to introduce:
- **`lua/finn/remap.lua`** — global native-vim maps
- **`lua/finn/init.lua`** (LspAttach autocmd) — buffer-local LSP maps
- **`lua/plugins/*.lua`** — plugin-specific maps inside each `config`

Notably, `vim-tmux-navigator` (`tmux.lua`) owns `<C-h/j/k/l>` in normal mode for seamless nvim↔tmux pane navigation — avoid those for new normal-mode bindings.

## LSP & completion

`lua/plugins/lsp.lua` is the hub: mason + mason-lspconfig auto-install the servers in `ensure_installed` (`lua_ls`, `ts_ls`, `eslint`, `jsonls`). To add a language server, add it to `ensure_installed` and, if it needs non-default settings, add a handler entry alongside the existing `lua_ls`/`eslint`/`ts_ls` ones. Completion (`nvim-cmp`) and its capabilities are wired in the same file; `<C-n>`/`<C-p>` navigate suggestions only while the completion popup is open.

## Indentation

Editor default is 4-space expandtab (`misc.lua`), but `vim-sleuth` auto-detects per file and some plugin specs use tabs. Match the indentation of the file you're editing rather than the global default.
