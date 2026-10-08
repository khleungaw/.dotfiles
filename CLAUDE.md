# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A lazy.nvim-managed Neovim configuration (dotfiles). It is Lua, not a typical app.
There is no build/lint/test step for the config itself — "building" a plugin means running
its `build` command (e.g. `:TSUpdate`, `make` for treesitter-fzf).

## Layout

```
init.lua                 entrypoint: requires core.settings/core.autocmds, then configures lazy.nvim, enables LSP
lua/core/settings/       options.lua, mappings.lua, diagnostic.lua   (settings, loaded first)
lua/core/autocmds/       lsp_autocmds.lua, yank_highlight.lua         (autocmds, loaded second)
lua/core/plugins/        one spec file per plugin (see below)
lua/core/plugins/themes/ onedark.lua
lua/telescope/custom/    buffer_delete_picker.lua (custom telescope picker)
lsp/                     lua_ls.lua, ts_ls.lua, rust_analyzer.lua      (custom LSP specs)
```

`init.lua` runs `core.settings` **before** plugins load so the `mapleader` (`<space>`) is set first.
Plugins are registered via `require("lazy").setup({ spec = { import = "core.plugins" }, ... })`, so
each file in `lua/core/plugins/` returns a plugin spec table. `lua/core/settings/` and
`lua/core/autocmds/` are plain modules (no lazy spec).

## Conventions

- **Leader** is `<space>` (`vim.g.mapleader = " "`, set in `core.settings.options`).
- Keymap groups are declared in `which-key.lua` (e.g. `[C]ode`, `[S]earch`, `[T]elescope`) and
  individual keymaps use the first-letter mnemonic style (`[G]oto [D]efinition`).
- Plugin `opts`/`config` live inside each plugin's spec file, not in a separate file.
- Lua formatting is driven by `.luarc.json` (`format.enable`, tab-width 4, 160 cols, double quotes).
  `.stylua.toml` was intentionally removed; do not re-add it.

## Commands relevant to this repo

- Update/upgrade plugins: `:Lazy update`, `:Lazy sync`, `:Lazy! sync`. UI: `:Lazy` or `<leader>L`.
- Rebuild treesitter grammars (also the `build` step for `nvim_treesitter`): `:TSUpdate`.
- Format: `<leader>f` runs `conform.format` (lua_ls/lua via luarc default, rust via `rustfmt`,
  ts/tsx via `bun x prettier`).
- Install a treesitter grammar manually: `:TSInstall <grammar>` (list with `:TSInstallInfo`).

## Plugins and where their non-default config lives

- `conform.nvim` (`lua/core/plugins/conform.lua`): `<leader>f` formatter; formatters differ by ft
  (rust=rustfmt `+nightly --edition 2021`, ts/tsx=prettier run through `bun`).
- `noice.nvim` (`lua/core/plugins/noice.lua`): presets (bottom_search, command_palette,
  long_message_to_split, lsp_doc_border); custom `init` colors indent guide to the onedark palette.
- `nvim-cmp` (`lua/core/plugins/nvim_cmp.lua`): LSP + luasnip + path sources, full custom mapping.
- `telescope.nvim` (`lua/core/plugins/telescope.lua`, branch `0.1.x`): search keymaps, plus custom
  `<leader>Tbd` (buffer delete picker, `lua/telescope/custom/buffer_delete_picker.lua`) and
  `<leader>Tsc` (colorscheme picker). `telescope-fzf-native` requires `make` + pcre dev headers.
- `snacks.nvim` (`lua/core/plugins/snacks.lua`): almost everything disabled; only `indent` and
  `scope` are on.
- `nvim_treesitter.lua`: ensure_installed set (bash, c, html, lua, luadoc, markdown×2, vim, vimdoc,
  regex, markdown_inline), indent disabled for ruby.
- `mini.lua`: only `mini.surround` and `mini.comment` enabled.
- `neogit.lua`: `<leader>g` opens git in a split.
- LSP specs (`lsp/`): `lua_ls` and `ts_ls` have custom `root_dir` logic and user commands;
  `rust_analyzer.lua` computes the cargo workspace root via `cargo metadata`, wires `runSingle`,
  and registers `:LspCargoReload`.

## Notes

- Colorscheme is onedark (`style = "deep"`), applied in the theme spec's `init`.
- `<C-z>` is redefined to undo and `<C-y>` to redo (see `core.settings.mappings`).
- The `bash` dir holds dotfiles; activate via `.bash_profile` pointing at `~/.config/bash/.bashrc`.
