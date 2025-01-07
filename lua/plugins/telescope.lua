return {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-ui-select.nvim'}, {
        'nvim-tree/nvim-web-devicons',
        enabled = true
    }, {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',

        cond = function()
            return vim.fn.executable 'make' == 1
        end
    }},
    config = function()

        require('telescope').setup {
            extensions = {
                ['ui-select'] = {require('telescope.themes').get_dropdown()},
                aerial = {
                  -- Set the width of the first two columns (the second
                  -- is relevant only when show_columns is set to 'both')
                  col1_width = 4,
                  col2_width = 30,
                  -- How to format the symbols
                  format_symbol = function(symbol_path, filetype)
                    if filetype == "json" or filetype == "yaml" then
                      return table.concat(symbol_path, ".")
                    else
                      return symbol_path[#symbol_path]
                    end
                  end,
                  -- Available modes: symbols, lines, both
                  show_columns = "both",
                },

              },

        }
        require("telescope").load_extension("aerial")
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    end
}
