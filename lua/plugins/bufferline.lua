return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs", -- Can be "buffers" or "tabs"
                themable = true, -- Allows theme customization
                numbers = "none", -- Options: "none", "ordinal", "buffer_id", "both"

                -- Icons for close buttons and modified buffers
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",

                -- LSP diagnostics integration
                diagnostics = "nvim_lsp",

                -- Separator styles (options: "slant", "padded_slant", "thick", "thin", etc.)
                separator_style = "thin",

                -- Display settings
                show_buffer_close_icons = true,
                show_close_icon = true,
                always_show_bufferline = false,
                color_icons = true,

                -- Hover tooltips (shows close button on hover)
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" }
                },

                -- Pick buffers with a key
                buffer_picker = {
                    enable = true,
                    selection = "",
                }
            }
        })
    end
}
