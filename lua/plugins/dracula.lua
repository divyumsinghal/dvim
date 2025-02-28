-- [[Dracula]]
-- Dracula theme configuration
-- https://github.com/Mofiqul/dracula.nvim
return {
    'Mofiqul/dracula.nvim',
    priority = 1000, -- Load this theme early to ensure proper styling
    config = function()
        -- Set up Dracula theme with custom highlights and options
        require('dracula').setup({
            -- Enable transparency for background and floats
            transparent_bg = false, -- Transparent background
            show_end_of_buffer = true, -- Display '~' characters at buffer end
            italic_comment = true, -- Enable italic style for comments
            colors = {
                bg = "#282A36",
                fg = "#F8F8F2",
                selection = "#44475A",
                comment = "#6272A4",
                red = "#FF5555",
                orange = "#FFB86C",
                yellow = "#F1FA8C",
                green = "#50fa7b",
                purple = "#BD93F9",
                cyan = "#8BE9FD",
                pink = "#FF79C6",
                bright_red = "#FF6E6E",
                bright_green = "#69FF94",
                bright_yellow = "#FFFFA5",
                bright_blue = "#D6ACFF",
                bright_magenta = "#FF92DF",
                bright_cyan = "#A4FFFF",
                bright_white = "#FFFFFF",
                menu = "#21222C",
                visual = "#3E4452",
                gutter_fg = "#4B5263",
                nontext = "#3B4048",
                white = "#ABB2BF",
                black = "#191A21"
            }
            -- overrides = {
            --   NonText = { fg = "white" }, -- set NonText fg to white
            --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
            --   Nothing = {} -- clear highlight of Nothing
            -- },
        })

        -- Apply the theme
       
        vim.cmd('colorscheme dracula-soft')

        -- Configure highlights for comments
        vim.cmd([[highlight Comment gui=italic]])
        vim.cmd.hi 'Comment gui=italic'
    end
}
