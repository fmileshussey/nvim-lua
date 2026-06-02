# nvim config

Personal Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim).

## Fresh install

```sh
git clone https://github.com/fmileshussey/nvim-lua.git ~/.config/nvim
nvim   # lazy.nvim bootstraps itself and installs all plugins on first launch
```

Mason will auto-install LSPs in the background on first open — watch the bottom-right for fidget progress.

---

## Quickstart — coming back after a while

**Leader key:** `Space`

> Forgot a binding? Pause after pressing a prefix (e.g. `Space`) and **which-key** pops up a live list of what comes next. `<leader>wk` shows buffer-local keymaps on demand.

### Navigation
| Key | Action |
|-----|--------|
| `<leader>pv` | File explorer (netrw) |
| `<leader>pf` | Find files, incl. hidden & gitignored — excludes `.git/` and `node_modules/` (Telescope) |
| `<C-p>` | Find git-tracked files (Telescope) |
| `<leader>ps` | Live grep across project |
| `<C-d>` / `<C-u>` | Half-page down/up (cursor stays centred) |

### Harpoon
| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to the list |
| `<C-e>` | Toggle the quick menu |
| `<leader>1`–`<leader>4` | Jump to harpooned file 1–4 |
| `<leader>hp` / `<leader>hn` | Previous / next file in the list |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>vrn` | Rename symbol |
| `<leader>vd` | Show diagnostic float |
| `[d` / `]d` | Previous / next diagnostic |
| `gr` / `grr` | Find references (Telescope) |
| `<leader>fw` | Workspace symbols (Telescope) |
| `<leader>fs` | Document symbols (Telescope) |
| `<C-h>` *(insert)* | Signature help |

### Completion
| Key | Action |
|-----|--------|
| `<C-n>` / `<C-p>` | Next / previous suggestion |
| `<C-y>` | Confirm suggestion |
| `<C-Space>` | Trigger completion manually |

### Editing
| Key | Action |
|-----|--------|
| `<leader>f` | Format document |
| `J` / `K` *(visual)* | Move selection down / up |
| `<leader>y` | Yank to system clipboard |
| `<leader>p` *(visual)* | Paste without clobbering register |
| `gc` | Toggle comment (vim-commentary) |

### Git & history
| Key | Action |
|-----|--------|
| `<leader>gs` | Open Fugitive (git status) |
| `<leader>gb` | Toggle inline current-line git blame |
| `<leader>gB` | Show full blame for the current line |
| `<leader>gp` | Preview the hunk under the cursor |
| `<leader>gr` | Reset the hunk under the cursor |
| `]c` / `[c` | Jump to next / previous git hunk |
| `<leader>u` | Toggle Undotree |
| `<leader>rm` | Preview the project's README with Glow |
| `<leader>?` | Show this config's keybindings (renders this README with Glow) |

### Tmux pane navigation
`<C-h>` `<C-j>` `<C-k>` `<C-l>` — move between nvim splits and tmux panes seamlessly.

---

## Plugins

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Plugin manager |
| catppuccin-frappe | Colourscheme |
| telescope.nvim | Fuzzy finder — image files preview via `chafa` (`brew install chafa`) |
| harpoon (harpoon2) | Quick file marking & jumping |
| which-key.nvim | Live popup of keybindings under a prefix |
| nvim-treesitter | Syntax highlighting & indentation |
| nvim-lspconfig + mason | Language servers |
| nvim-cmp + LuaSnip | Completion |
| vim-fugitive | Git integration |
| gitsigns.nvim | Git change signs in the gutter, hunk nav & inline blame |
| satellite.nvim | Right-side scrollbar map of git changes, diagnostics & search |
| undotree | Visual undo history |
| mini.pairs | Auto-close brackets/quotes |
| vim-surround | Surround text objects |
| vim-commentary | Toggle comments with `gc` |
| vim-sleuth | Auto-detect indentation |
| vim-tmux-navigator | Unified nvim/tmux navigation |
| fidget.nvim | LSP progress indicator |
| log-highlight.nvim | Syntax highlighting for log files |
| vim-be-good | Typing practice (`:VimBeGood`) |

## LSPs (auto-installed via Mason)

- `ts_ls` — TypeScript / JavaScript
- `eslint` — ESLint linting
- `jsonls` — JSON (package.json, tsconfig.json, etc.)
- `lua_ls` — Lua (for editing this config)

Manage servers with `:Mason`.
