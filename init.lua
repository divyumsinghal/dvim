--[[init.lua]]

-- Load core configurations
require 'dvim.options'      -- Load options
require("dvim.autocmds")    -- Load autocommands
require 'dvim.keymaps'      -- Load keymaps

-- Lazy.nvim plugin manager setup
require 'dvim.lazy'         -- Install lazy.nvim
