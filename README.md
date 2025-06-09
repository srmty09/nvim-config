# smol-vim

A minimal yet powerful Neovim configuration for productivity, coding, and data science.

## Features
- **Pure Black Theme**: All backgrounds set to pure black for eye comfort and focus.
- **Modern UI**: Bufferline, lualine, nvim-tree, and a custom dashboard with ASCII art.
- **Telescope**: Fuzzy file finder, live grep, and file browser for fast navigation.
- **Auto-save**: Files are saved automatically on focus change or insert leave.
- **Smooth Scrolling**: Neoscroll for buttery-smooth navigation.
- **Indent Guides**: Pretty indent lines with indent-blankline.
- **Transparency**: Optional glassy look for floating windows.
- **Floating Terminal**: Per-tab floating terminal in the file's directory, close with Esc.
- **Jupyter Notebook Support**: Edit and run `.ipynb` files with jupytext.nvim and molten-nvim.
- **Interactive Dashboard**: Custom ASCII art and motivational quotes.
- **Rainbow Parentheses**: Colorful code with treesitter.
- **Which-key**: Keybinding hints popup.
- **Tab/Buffer Navigation**: Tab/Shift-Tab to switch, Space+arrows for window movement.

## Key Shortcuts
- `<Space>s` — Open Telescope file browser (navigate any directory)
- `<Space>g` — Live grep (search in all files)
- `<Space>t` — Floating terminal in current file's directory
- `<Tab>` / `<S-Tab>` — Next/previous buffer (tab)
- `<Space>+Arrow` — Move between windows
- `Esc` in terminal — Close floating terminal

## Jupyter Notebook Support
- Open `.ipynb` files as Python/Markdown
- Run code cells interactively with molten-nvim

## Installation
1. Clone this repo to your config directory:
   ```sh
   git clone https://github.com/srmty09/nvim-config.git ~/.config/nvim
   ```
2. Open Neovim and run `:Lazy sync` to install plugins.
3. Restart Neovim.

## Requirements
- [Neovim 0.8+](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Python 3](https://www.python.org/) (for Jupyter support)
- [Jupyter](https://jupyter.org/) (`pip install jupyter`)

## Credits
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
- [molten-nvim](https://github.com/benlubas/molten-nvim)
- [jupytext.nvim](https://github.com/GCBallesteros/jupytext.nvim)

---

> "Stay curious. Keep building. Never give up!" 