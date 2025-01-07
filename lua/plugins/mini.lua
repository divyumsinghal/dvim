return { -- Collection of various small independent plugins/modules
'echasnovski/mini.nvim',
config = function()
  -- Better Around/Inside textobjects
  --
  -- Examples:
  --  - va)  - [V]isually select [A]round [)]paren
  --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  --  - ci'  - [C]hange [I]nside [']quote
  require('mini.ai').setup { n_lines = 500 }

  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  -- - sd'   - [S]urround [D]elete [']quotes
  -- - sr)'  - [S]urround [R]eplace [)] [']
  require('mini.surround').setup()

  -- Simple and easy statusline.
  --  You could remove this setup call if you don't like it,
  --  and try some other statusline plugin
  local statusline = require 'mini.statusline'
  -- set use_icons to true if you have a Nerd Font
  statusline.setup { use_icons = vim.g.have_nerd_font }

  -- You can configure sections in the statusline by overriding their
  -- default behavior. For example, here we set the section for
  -- cursor location to LINE:COLUMN
  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function()
    return '%2l:%-2v'
  end

  -- ... and there is more!
  --  Check out: https://github.com/echasnovski/mini.nvim
end,
}

--[[
return {
  'echasnovski/mini.nvim',
  version = '*', -- Use the latest stable release
  config = function()
    -- Import the mini.nvim modules
    local mini_statusline = require('mini.statusline')
    local mini_comment = require('mini.comment')
    local mini_surround = require('mini.surround')
    local mini_ai = require('mini.ai')

    -- Configure mini.statusline
    mini_statusline.setup({
      content = {
        active = function()
          return mini_statusline.combine_groups({
            { hl = 'MiniStatuslineMode', strings = { mini_statusline.section_mode() } },
            { hl = 'MiniStatuslineFilename', strings = { mini_statusline.section_filename() } },
            { hl = 'MiniStatuslineFileinfo', strings = { mini_statusline.section_fileinfo() } },
            { hl = 'MiniStatuslineGit', strings = { mini_statusline.section_git() } },
          })
        end,
        inactive = nil,
      },
    })

    -- Configure mini.comment
    mini_comment.setup({
      mappings = {
        comment = 'gc', -- Comment toggle
        comment_line = 'gcc', -- Comment the current line
        textobject = 'gc', -- Textobject for comment
      },
    })

    -- Configure mini.surround
    mini_surround.setup({
      mappings = {
        add = 'sa', -- Add surrounding
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding
        find_left = 'sF', -- Find surrounding to the left
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update number of surrounding lines
      },
    })

    -- Configure mini.ai
    mini_ai.setup({
      -- Custom text objects can be defined here
      custom_textobjects = nil,
    })
  end,
}

]]