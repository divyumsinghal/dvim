--[[init.lua]]

require 'dvim.options'      -- Load options

-- Lazy.nvim plugin manager setup
require 'dvim.lazy'         -- Install & setup lazy & plugins

-- Load core configurations
require 'dvim.autocmds'     -- Load autocommands
require 'dvim.keymaps'      -- Load keymaps
