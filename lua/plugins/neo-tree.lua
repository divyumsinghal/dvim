return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"},

    cmd = "Neotree",
    opts_extend = {"sources"},

    config = function()

        local sources = {
            { source = "filesystem", display_name = " File" },
            { source = "buffers", display_name = " Buffers" },
            { source = "diagnostics", display_name = " Diagnostics" },
            { source = "git_status", display_name = " Git" },
            { source = "document_symbols", display_name = "# Symbols" }
        }

        require('neo-tree').setup {
            auto_clean_after_session_restore = true,
            close_if_last_window = false, -- dont close Neo-tree if it's the last window
            open_on_setup = true, -- Opens Neo-tree when Neovim starts
            popup_border_style = 'rounded', -- Border style for popups
            enable_git_status = true, -- Show git status
            enable_diagnostics = true, -- Show diagnostics
                        source_selector = {
                winbar = true,
                content_layout = "center",
                sources = sources,
        statusline = true,
        git_status = true
            },
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 1, -- Padding before the icon
                    with_markers = true,
                    highlight = 'NeoTreeIndentMarker'
                },
                modified = {
                    symbol = '[+]',
                    highlight = 'NeoTreeModified'
                },
         diagnostics = {
            symbols = {
                hint = "󰌵", -- Hint
                info = "",  -- Info
                warn = "",  -- Warning
                error = ""  -- Error
            },
            highlights = {
                hint = "DiagnosticHint",
                info = "DiagnosticInfo",
                warn = "DiagnosticWarn",
                error = "DiagnosticError"
            }
        }

            },
            event_handlers = {{
                event = "file_opened",
                handler = function()
                    -- Reopen Neo-tree after opening a file
                    vim.cmd("Neotree show")
                end
            }, {
                event = "file_closed",
                handler = function()
                    -- Ensure Neo-tree remains visible after a file is closed
                    vim.cmd("Neotree show")
                end
            }},
            window = {
                position = 'right', -- Can be "left", "right", "top", or "bottom"
                width = 40, -- Adjust width as needed
                mappings = {
                    ['<space>'] = 'toggle_node',
                    ['<2-LeftMouse>'] = 'open_tabnew',
                    ['<cr>'] = 'open_tabnew',
                    ['S'] = 'split_with_window_picker',
                    ['s'] = 'vsplit_with_window_picker',
                    ['t'] = 'open_tabnew',
                    ['C'] = 'close_node',
                    ['R'] = 'refresh',
                    ['a'] = {
                        'add',
                        config = {
                            show_path = 'absolute' -- "none", "relative", "absolute"
                        }
                    },
                    ['A'] = 'add_directory', -- Create a directory
                    ['d'] = 'delete',
                    ['r'] = 'rename',
                    ['y'] = 'copy_to_clipboard',
                    ['x'] = 'cut_to_clipboard',
                    ['p'] = 'paste_from_clipboard',
                    ['c'] = 'copy', -- Copy file/folder
                    ['m'] = 'move', -- Move file/folder
                    ['q'] = 'close_window',
                    ['?'] = 'show_help'
                },
                fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                    ["<C-J>"] = "move_cursor_down",
                    ["<C-K>"] = "move_cursor_up"
                }
            },
            filesystem = {
                filtered_items = {
                    visible = false, -- Show hidden files if false
                    hide_dotfiles = false,
                    hide_gitignored = true
                },
                follow_current_file = true, -- Focus on the current file in the tree
                group_empty_dirs = true, -- Group empty directories
                hijack_netrw_behavior = 'open_default', -- NetRW hijack options: "open_default", "disabled", "open_current"
                use_libuv_file_watcher = true -- Update tree automatically
            },
            buffers = {
                follow_current_file = true, -- Focus on the current buffer in the tree
                group_empty_dirs = true -- Group empty directories
            },
            git_status = {
                window = {
                    position = 'float' -- Float git status window
                }
            }
        }

    end
}
