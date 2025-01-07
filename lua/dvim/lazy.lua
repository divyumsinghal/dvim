--[[lazy.lua]] -- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--[[
-- validate that lazy is available
if not pcall(require, "lazy") then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
]]

--[[plugins]]

-- [[ Install and set up all plugins from plugins directories ]]
-- Setup lazy.nvim and configure plugins
require("lazy").setup({
    spec = "plugins",
    defaults = {
        lazy = false,
        version = false,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false
  }
}, {
    defaults = {
        lazy = true
    },
    install = {
        missing = true
    },
    ui = {
      border = "rounded",
    },
})

vim.cmd.colorscheme("catppuccin")
