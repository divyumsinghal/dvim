local option = vim.opt
local global = vim.g

-------------------------------------- globals ------------------------------------------

-- Set <space> as the leader key -- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader may be used)
global.mapleader = ' '
global.maplocalleader = ' '
global.have_nerd_font = true

-------------------------------------- optionions ------------------------------------------

option.number = true -- Show line numbers
option.relativenumber = false -- Show relative line numbers
option.cursorline = true -- Highlight the line where the cursor is
option.termguicolors = true -- Enable 24-bit colors
option.signcolumn = 'yes' -- Always show the sign column to avoid text shifting
option.scrolloff = 8 -- Minimum lines to keep above and below the cursor
option.inccommand = 'split' -- Preview substitutions live, as you type!

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
option.list = true
option.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}
option.fillchars = {
    eob = ' '
} -- Prevent showing ~ on empty lines

-- Change GUI cursor styles
option.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
-- [[ Mouse and Clipboard ]]
option.mouse = 'a'
-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.schedule(function()
    option.clipboard = 'unnamedplus'
end)
-- option.cursorlineoption = 'number'

-- [[ Editing Behavior ]]
option.wrap = false -- Disable line wrapping
option.smartindent = true -- Enable smart indentation
option.autoindent = true -- Auto-indent new lines
option.expandtab = true -- Convert tabs to spaces
option.tabstop = 2 -- Number of spaces per tab
option.softtabstop = 2 -- Number of spaces per tab during editing
option.shiftwidth = 2 -- Indent width
option.backspace = 'indent,eol,start' -- Allow backspace in insert mode for indent, EOL, and start
option.breakindent = true -- Enable break indent
option.signcolumn = 'yes'

-- [[ Searching ]]
option.ignorecase = true -- Ignore case while searching
option.smartcase = true -- Case-sensitive if search contains capital letters
option.hlsearch = false -- Disable highlighting of search matches
option.incsearch = true -- Incremental search as you type

-- [[ Undo and Swap ]]
option.swapfile = false -- Disable swap file creation
option.backup = false -- Disable backup files
option.undofile = true -- Enable undo history
option.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- Set undo directory

-- [[ Splits ]]
option.splitright = true -- Open vertical splits to the right
option.splitbelow = true -- Open horizontal splits below

-- [[ Status Line ]]
option.laststatus = 3 -- Use a global status line
option.showmode = false -- Hide default mode indicator (e.g., -- INSERT --)
