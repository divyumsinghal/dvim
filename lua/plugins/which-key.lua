return 
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = {
            mappings = vim.g.have_nerd_font,
            keys = vim.g.have_nerd_font and {},
        }
    },
    config = function(_, opts)
        require("which-key").setup(opts)
    end,
    
  }
