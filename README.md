# DVIM

A basic NVIM Config

# TODO

- Manage Markdown
- Buffers/Tabs
- Lualine
- Autocomplete brackets, - , other stuff automatically.
- terminal
- neotree

# Plugins

## LuaSnip.lua
- **Description**: LuaSnip is a snippet engine for creating and using reusable code templates across various programming languages.
- **Options**:
  - Keybindings for snippet expansion and navigation.
  - Custom directories to store snippets.
  - Integration with other plugins like nvim-cmp for autocompletion.
- **Effect**: Allows the insertion of pre-defined code snippets. As you type, snippets can expand dynamically into code templates, with placeholders highlighted for easy navigation.

## aerial.lua
- **Description**: Aerial provides a sidebar displaying the outline of code, such as functions, classes, and variables.
- **Options**:
  - Filter symbols by type (e.g., methods, properties).
  - Keybindings to jump to specific symbol lazy-loading plugins.
  - Manage plugin dependencies.
- **Effect**: Improves startup time by loading only necessary plugins initially and deferring others until required.



## lazydev.lua
- **Description**: Lazydev offers tools for developing and testing plugins using lazy.nvim.
- **Options**:
  - Utilities for testing plugin configurations.
- **Effect**: Adds helper commands and UI feedback when developing plugins, like logging messages or plugin state information.



## lazyvim.lua
- **Description**: LazyVim is a pre-configured setup for lazy.nvim with pre-installed settings for common plugins.
- **Options**:
  - Modify default configurations for plugins like LSP, treesitter, and others.
- **Effect**: Pre-applies common configurations for other plugins, reducing the need for manual setup.



## lspkind.lua
- **Description**: Lspkind adds pictograms to Neovim's LSP completion items.
- **Options**:
  - Customize icons for different kinds of completions (e.g., method, class).
- **Effect**: Adds small, colorful icons next to completion menu entries, making them visually distinct.



## lualine.lua
- **Description**: Lualine is a customizable status line plugin for Neovim.
- **Options**:
  - Configure sections to display items like mode, file path, and LSP status.
  - Integrate with themes like Catppuccin or Dracula.
- **Effect**: Displays a dynamic status line at the bottom of the editor with information like the current mode, file, and diagnostics.



## luvit-meta.lua
- **Description**: Provides additional Lua runtime features for Luvit, a lightweight Lua environment.
- **Options**:
  - Extendable with custom modules.
- **Effect**: Adds runtime-specific functionalities for Lua projects in Luvit, such as debugging tools.



## mason.lua
- **Description**: Mason is a package manager for LSP servers, linters, and formatters.
- **Options**:
  - Install and manage LSP servers and other tools through Mason's UI.
- **Effect**: Displays an interactive UI for managing tools, with a list of installed and available items.


## mini.lua
- **Description**: Mini.nvim is a collection of small, modular plugins for various Neovim features.
- **Options**:
  - Enable or disable specific modules (e.g., completion, indentation).
- **Effect**: Adds modular features such as smart completion, commenting, and visual enhancements.


## neo-tree.lua
- **Description**: Neo-tree is a modern file explorer for Neovim.
- **Options**:
  - Configurable icons, layout, and search filters.
- **Effect**: Opens a side panel displaying the file structure with icons, highlighting, and filtering options.



## noice.lua
- **Description**: Noice redefines the notification and message system in Neovim.
- **Options**:
  - Customize message display styles (e.g., floating windows).
- **Effect**: Replaces default notifications with styled floating windows or status-line indicators.



## nui.lua
- **Description**: Nui provides UI comp Neovim.
- **Options**:
  - Integrate sources like LSP, snippets, and buffers.
  - Configure keybindings for navigation and selection.
- **Effect**: Displays a dropdown completion menu when typing, showing suggestions based on context.



## nvim-colorizer.lua
- **Description**: Nvim-colorizer highlights color codes inline.
- **Options**:
  - Specify file types or patterns for colorizing.
- **Effect**: Displays actual colors inline next to their hex or RGB codes in supported files.



## nvim-lspconfig.lua
- **Description**: Simplifies setting up and configuring LSP servers in Neovim.
- **Options**:
  - Pre-configured settings for popular servers like pyright, clangd.
- **Effect**: Adds LSP functionalities, such as hover popups and diagnostics, with minimal setup.



## nvim-notify.lua
- **Description**: Nvim-notify provides a styled notification system.
- **Options**:
  - Customize styles and history.
- **Effect**: Displays non-intrusive, styled notification popups in the corner of the editor.



## nvim-treesitter.lua
- **Description**: Nvim-treesitter enhances syntax highlighting and code parsing using Treesitter.
- **Options**:
  - Enable advanced features like folding, navigation, and incremental selection.
- **Effect**: Adds colorful and precise syntax highlighting along with better text manipulation tools.



## nvim-web-devicons.lua
- **Description**: Adds file icons for file explorers and status lines.
- **Options**:
  - Customize icon sets and mappings.
- **Effect**: Displays icons next to file names in tools like neo-tree and lualine.



## oil.lua
- **Description**: Oil provides a minimal file browser.
- **Options**:
  - Navigation and search configurations.
- **Effect**: Opens a simple text-based file browser with easy file operations.



## snacks.lua
- **Description**: Adds playful and interactive features to Neovim.
- **Effect**: Enhances the Neovim experience with fun, non-essential features like animations or messages.



## telescope.lua
- **Description**: Telescope is a fuzzy finder for files, commands, and more.
- **Options**:
  - Integration with LSP, git, and other sources.
- **Effect**: Opens a floating window for searching with real-time filtering as you type.



## twilight.lua
- **Description**: Twilight dims inactive code regions to focus on the active section.
- **Options**:
  - Set dimming intensity and area.
- **Effect**: Non-focused code areas become darker or grayed out, while the active area remains highlighted.



## volt.lua
- **Description**: A project management tool for Lua development.
- **Effect**: Provides commands for handling Lua module dependencies and projects.



## which-key.lua
- **Description**: Displays a popup with available keybindings as you type.
- **Options**:
  - Customize popup layout and timeout.
- **Effect**: Shows a floating window listing possible keybindings when a leader key is pressed.
onents for plugins, such as modals, input fields, and menus.
- **Options**:
  - Customize layouts and visual styles.
- **Effect**: Adds visually styled and interactive UI components for other plugins.



## nvim-cmp.lua
- **Description**: Nvim-cmp is a flexible autocompletion engine fors.
- **Effect**: Opens a sidebar with a list of symbols categorized by type. Clicking or navigating to a symbol moves the cursor to its location in the code.



## alpha.lua
- **Description**: Alpha is a startup dashboard plugin that displays customizable content when Neovim launches.
- **Options**:
  - Configure dashboard sections (e.g., recent files, quick commands).
  - Add custom greetings or ASCII art.
- **Effect**: Shows a visually styled dashboard on startup with options like a list of recent files, buttons for quick actions, and a welcome message.



## catppuccin.lua
- **Description**: Catppuccin is a theme plugin providing soft and pastel color schemes.
- **Options**:
  - Variants such as Latte (light) and Mocha (dark).
  - Compatibility tweaks for other plugins' UI elements.
- **Effect**: Changes the editor's color scheme to a soft, pastel palette with distinct contrasts for different syntax elements.



## dracula.lua
- **Description**: Dracula is a dark theme with vibrant colors and high contrast.
- **Options**:
  - Adjust background settings and contrast levels.
  - Customize integration with LSP and status lines.
- **Effect**: Applies a dark color scheme with bright, vibrant colors for syntax highlighting and UI elements.



## dressing.lua
- **Description**: Dressing improves the appearance of Neovim's input and select UI elements.
- **Options**:
  - Adjust the style and layout of modal dialogs.
  - Enable or disable certain UI components.
- **Effect**: Replaces plain input and select dialogs with a styled and centered floating window.



## indent-blankline.lua
- **Description**: Indent-blankline adds vertical indentation guides for better code readability.
- **Options**:
  - Highlight the current code block's indentation level.
  - Customize the appearance of indent guides.
- **Effect**: Displays vertical lines at indentation levels. The active code block's indent guide may be highlighted in a different color.



## lazy-nvim.lua
- **Description**: Lazy.nvim is a plugin manager designed for fast loading and lazy loading of plugins.
- **Options**:
  - Define conditions for
