return {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"},

    config = function()
        require("aerial").setup({
            backends = {"treesitter", "lsp", "markdown", "asciidoc", "man"},

            layout = {
                default_direction = "prefer_right", -- prefer_right, prefer_left, right, left, float
                placement = "window", -- or edge
                resize_to_content = true,
                preserve_equality = false
            },

            attach_mode = "window", -- window or global

            keymaps = {
                ["?"] = "actions.show_help",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.jump",
                ["<2-LeftMouse>"] = "actions.jump",
                ["<C-v>"] = "actions.jump_vsplit",
                ["<C-s>"] = "actions.jump_split",
                ["p"] = "actions.scroll",
                ["<C-j>"] = "actions.down_and_scroll",
                ["<C-k>"] = "actions.up_and_scroll",
                ["{"] = "actions.prev",
                ["}"] = "actions.next",
                ["[["] = "actions.prev_up",
                ["]]"] = "actions.next_up",
                ["q"] = "actions.close",
                ["o"] = "actions.tree_toggle",
                ["za"] = "actions.tree_toggle",
                ["O"] = "actions.tree_toggle_recursive",
                ["zA"] = "actions.tree_toggle_recursive",
                ["l"] = "actions.tree_open",
                ["zo"] = "actions.tree_open",
                ["L"] = "actions.tree_open_recursive",
                ["zO"] = "actions.tree_open_recursive",
                ["h"] = "actions.tree_close",
                ["zc"] = "actions.tree_close",
                ["H"] = "actions.tree_close_recursive",
                ["zC"] = "actions.tree_close_recursive",
                ["zr"] = "actions.tree_increase_fold_level",
                ["zR"] = "actions.tree_open_all",
                ["zm"] = "actions.tree_decrease_fold_level",
                ["zM"] = "actions.tree_close_all",
                ["zx"] = "actions.tree_sync_folds",
                ["zX"] = "actions.tree_sync_folds",
              },

              highlight_mode = "split_width",   -- Determines line highlighting mode when multiple splits are visible
              highlight_closest = true,         -- Highlight the closest symbol if the cursor is not exactly on one.
              highlight_on_hover = false,       -- Highlight the symbol in the source buffer when cursor is in the aerial win
              highlight_on_jump = 300,          -- When jumping to a symbol, highlight the line for this many ms  -- Set to false to disable
              autojump = false,                 -- Jump to symbol in source window when the cursor moves
              nerd_font = "auto",




        })
    end
}
