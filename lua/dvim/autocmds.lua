local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

--[[

create_autocmd('TextYankPost', {
    group = group,
    desc = 'Highlight on yank',
    callback = function()
      vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
    end,
  })


create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("PersistentNeoTree", { clear = true }),
    callback = function()
        if not vim.bo.filetype == "neo-tree" then
            require("neo-tree.command").execute({ toggle = true })
        end
    end,
})

create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NeoTreeOpen", { clear = true }),
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
            require("neo-tree").show()
        end
    end,
})


--]]

create_autocmd("VimEnter", {
  callback = function()
      vim.cmd("Neotree show")
  end,
})




-- Group for auto quitting when only sidebar windows are open
create_augroup("AutoQuit", { clear = true })
create_autocmd("BufEnter", {
  group = "AutoQuit",
  desc = "Quit Vim if only sidebar windows are open",
  callback = function()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    if #wins <= 1 then return end
    local sidebar_fts = { aerial = true, ["neo-tree"] = true }
    for _, winid in ipairs(wins) do
      if vim.api.nvim_win_is_valid(winid) then
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local filetype = vim.bo[bufnr].filetype
        if not sidebar_fts[filetype] then return end
        sidebar_fts[filetype] = nil
      end
    end
    if #vim.api.nvim_list_tabpages() > 1 then
      vim.cmd.tabclose()
    else
      vim.cmd.qall()
    end
  end,
})

-- Group for managing views
create_augroup("AutoView", { clear = true })
create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  group = "AutoView",
  desc = "Save view with mkview for real files",
  callback = function(event)
    if vim.b[event.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
  end,
})
create_autocmd("BufWinEnter", {
  group = "AutoView",
  desc = "Load view and enable saving for real files",
  callback = function(event)
    if not vim.b[event.buf].view_activated then
      local filetype = vim.bo[event.buf].filetype
      local buftype = vim.bo[event.buf].buftype
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[event.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
      end
    end
  end,
})

-- Highlight yanked text
create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})

-- Automatically create directories when saving files
create_autocmd("BufWritePre", {
  desc = "Automatically create parent directories",
  callback = function(args)
    local file = args.match
    if file:match "^%w+:[\\/][\\/]" then return end
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Disable line numbers for terminal buffers
create_autocmd("TermOpen", {
  desc = "Disable line number/fold column/sign column for terminals",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
  end,
})

-- Unlist quickfix buffers
create_autocmd("FileType", {
  desc = "Unlist quickfix buffers",
  pattern = "qf",
  callback = function() vim.opt_local.buflisted = false end,
})

-- Make 'q' close certain window types
create_augroup("QuickCloseWindows", { clear = true })

create_autocmd("BufWinEnter", {
  group = "QuickCloseWindows",
  desc = "Make 'q' close help, man, quickfix windows",
  callback = function(args)
    if vim.g.q_close_windows == nil then vim.g.q_close_windows = {} end
    if vim.g.q_close_windows[args.buf] then return end
    vim.g.q_close_windows[args.buf] = true
    for _, map in ipairs(vim.api.nvim_buf_get_keymap(args.buf, "n")) do
      if map.lhs == "q" then return end
    end
    if vim.tbl_contains({ "help", "nofile", "quickfix" }, vim.bo[args.buf].buftype) then
      vim.keymap.set("n", "q", "<Cmd>close<CR>", { desc = "Close window", buffer = args.buf, silent = true })
    end
  end,
})

create_autocmd("BufDelete", {
  group = "QuickCloseWindows",
  desc = "Clean up QuickCloseWindows cache",
  callback = function(args)
    if vim.g.q_close_windows then vim.g.q_close_windows[args.buf] = nil end
  end,
})
