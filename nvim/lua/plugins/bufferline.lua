return
{       'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    mode = 'tabs',
                    separator_style = 'slant',
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true
                },
                highlights = {
                    separator = {
                        guifg = '#073642',
                        guibg = '#002b36',
                    },
                    separator_selected = {
                        guifg = '#073642',
                        guifg = '#073642',
                    },
                    background = {
                        guifg = '#0657b83',
                        guibg = '#002b36',
                    },
                    buffer_selected = {
                        guifg = '#fdf6e3',
                        gui = 'bold',
                    },
                    fill = {
                        guibg = '#073642'
                    }
                }
            })
           vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
           vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
        end
}

