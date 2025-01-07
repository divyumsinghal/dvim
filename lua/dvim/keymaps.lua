local map = function(keys, func, desc, mode, buf)
    mode = mode or 'n'
    local opts = {
        desc = desc,
        noremap = true,
        silent = true
    }
    if buf then
        opts.buffer = buf
    end

    vim.keymap.set(mode, keys, func, opts)

end

-- Personal remapping: Switching `j` and `k` (up and down)
local modes = {'', 'n', 'v', 'o'}
for _, mode in ipairs(modes) do
    map('j', 'k', 'Switch `j` with `k` (up)', mode)
    map('k', 'j', 'Switch `k` with `j` (down)', mode)

    map('<C-j>', '<C-k>', 'Switch `<C-j>` with `<C-k>` (up)', mode)
    map('<C-k>', '<C-j>', 'Switch `<C-k>` with `<C-j>` (down)', mode)
end

-- Insert mode remapping for `<C-j>` and `<C-k>`
map('<C-j>', '<C-k>', 'Switch `<C-j>` with `<C-k>` (up)', 'i')
map('<C-k>', '<C-j>', 'Switch `<C-k>` with `<C-j>` (down)', 'i')


-- cmp
local cmp = require("cmp")

map('<C-n>', cmp.mapping.select_next_item(), "Select next item in completion menu", 'i')
map('<C-p>', cmp.mapping.select_prev_item(), "Select previous item in completion menu", 'i')
map('<C-b>', cmp.mapping.scroll_docs(-4), "Scroll completion docs up", 'i')
map('<C-f>', cmp.mapping.scroll_docs(4), "Scroll completion docs down", 'i')
map('<C-y>', cmp.mapping.confirm {
    select = true
}, "Confirm selection in completion menu", 'i')
map('<C-Space>', cmp.mapping.complete {}, "Trigger completion menu", 'i')

-- Luasnip mappings
local luasnip = require("luasnip")

map('<C-l>', function()
    if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
    end
end, "Expand or jump with Luasnip", 'i')

map('<C-h>', function()
    if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
    end
end, "Jump back with Luasnip", 'i')

-- More keymaps...

-- [[ Split Navigation ]]
map('<C-h>', '<C-w><C-h>', 'Move focus to the [W]indow [H]')
map('<C-l>', '<C-w><C-l>', 'Move focus to the [W]indow [L]')
map('<C-j>', '<C-w><C-j>', 'Move focus to the [W]indow [J]')
map('<C-k>', '<C-w><C-k>', 'Move focus to the [W]indow [K]')

-- [[ Search ]]
local builtin = require 'telescope.builtin'
map('<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    '[S]earch and [R]eplace all occurrences of the current word in the file')
map('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
map('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
map('<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
map('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
map('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
map('<leader>sc', builtin.resume, '[S]earch [C]ontinue previous')
map('<leader>s.', builtin.oldfiles, '[S]earch [R]ecent Files ("." for repeat)')
map('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')

map('<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false
    })
end, '[/] Fuzzily search in current buffer')

map('<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files'
    }
end, '[S]earch [/] in Open Files')

map('<leader>sn', function()
    builtin.find_files {
        cwd = vim.fn.stdpath 'config'
    }
end, '[S]earch [N]eovim configuration files')

-- [[ LSP Keymaps ]]
map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
map('gr', builtin.lsp_references, '[G]oto [R]eferences')
map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', {'n', 'x'})
map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

-- [[ Toggle Keymaps ]]
map('<leader>tr', '<cmd>set rnu!<CR>', '[T]oggle [R]elative numbers')
map('<leader>tn', ':Neotree toggle<CR>', '[T]oggle [N]eo-tree')
map('<leader>tt', ':terminal<CR>', '[T]oggle [T]erminal')

-- [[ aerial ]]

-- Jump forwards/backwards with '{' and '}'
map("{", "<cmd>AerialPrev<CR>", "Jump to previous symbol")
map ("}", "<cmd>AerialNext<CR>", "Jump to next symbol")
map ("<leader>ta", "<cmd>AerialToggle!<CR>", "Toggle aerial")
