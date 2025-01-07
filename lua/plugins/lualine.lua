return {

    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function()

        local lualine = require('lualine')

        local colors = require('dracula').colors()

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end
        }

        local config = {

            options = {
                icons_enabled = true,
                theme = 'horizon',
                component_separators = {
                    left = '',
                    right = ''
                },
                section_separators = {
                    left = '',
                    right = ''
                },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {}
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100
                }
            },
            --[[
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {'location'}
            },
            ]]
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {
                    {
                      "aerial",
                      -- The separator to be used to separate symbols in status line.
                      sep = " ) ",
              
                      -- The number of symbols to render top-down. In order to render only 'N' last
                      -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
                      -- be used in order to render only current symbol.
                      depth = nil,
              
                      -- When 'dense' mode is on, icons are not rendered near their symbols. Only
                      -- a single icon that represents the kind of current symbol is rendered at
                      -- the beginning of status line.
                      dense = false,
              
                      -- The separator to be used to separate symbols in dense mode.
                      dense_sep = ".",
              
                      -- Color the symbol icons.
                      colored = true,
                    },
                },
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
              },
              inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
              },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }


        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            function()
                return '▊'
            end,
            color = {
                fg = colors.blue
            },
            padding = {
                left = 0,
                right = 1
            }
        }

        ins_left {

            function()
                return ''
            end,
            color = function()

                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red
                }
                return {
                    fg = mode_color[vim.fn.mode()]
                }
            end,
            padding = {
                right = 1
            }
        }

        ins_left {
            'filesize',
            cond = conditions.buffer_not_empty
        }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = {
                fg = colors.magenta,
                gui = 'bold'
            }
        }

        ins_left {'location'}

        ins_left {
            'progress',
            color = {
                fg = colors.fg,
                gui = 'bold'
            }
        }

        ins_left {
            'diagnostics',
            sources = {'nvim_diagnostic'},
            symbols = {
                error = ' ',
                warn = ' ',
                info = ' '
            },
            diagnostics_color = {
                error = {
                    fg = colors.red
                },
                warn = {
                    fg = colors.yellow
                },
                info = {
                    fg = colors.cyan
                }
            }
        }

        ins_left {function()
            return '%='
        end}

        ins_left {
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_get_option_value('filetype', {
                    buf = 0
                })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = ' LSP:',
            color = {
                fg = '#ffffff',
                gui = 'bold'
            }
        }

        ins_right {
            'o:encoding',
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = {
                fg = colors.green,
                gui = 'bold'
            }
        }

        ins_right {
            'fileformat',
            fmt = string.upper,
            icons_enabled = true,
            color = {
                fg = colors.green,
                gui = 'bold'
            }
        }

        ins_right {
            'branch',
            icon = '',
            color = {
                fg = colors.violet,
                gui = 'bold'
            }
        }

        ins_right {
            'diff',
            symbols = {
                added = ' ',
                modified = '󰝤 ',
                removed = ' '
            },
            diff_color = {
                added = {
                    fg = colors.green
                },
                modified = {
                    fg = colors.orange
                },
                removed = {
                    fg = colors.red
                }
            },
            cond = conditions.hide_in_width
        }

        ins_right {
            function()
                return '▊'
            end,
            color = {
                fg = colors.blue
            },
            padding = {
                left = 1
            }
        }

        lualine.setup(config)

    end

}
