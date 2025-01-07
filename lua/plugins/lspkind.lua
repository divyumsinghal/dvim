return {
    "onsails/lspkind.nvim",
    opts = {
        mode = "symbol",
        symbol_map = {
            Array = "󰅪", Boolean = "⊨", Class = "󰌗", Constructor = "", Key = "󰌆", Namespace = "󰅪",
            Null = "NULL", Number = "#", Object = "󰀚", Package = "󰏗", Property = "",
            Reference = "", Snippet = "", String = "󰀬", TypeParameter = "󰊄", Unit = "",
        },
    },
    enabled = true,
    config = function(_, opts)
        require("lspkind").init(opts)
    end,
}
