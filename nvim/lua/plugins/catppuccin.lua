return { 
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true, -- disables setting the background color.
            -- integrations = {
            --     cmp = true,
            --     gitsigns = true,
            --     nvimtree = true,
            --     treesitter = true,
            --     lualine = true,
            --     -- notify = false,
            --     -- mini = {
            --     --     enabled = true,
            --     --     indentscope_color = "",
            --     -- },
            -- }
        })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
