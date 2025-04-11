return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true, -- Show hidden files
                        hide_dotfiles = false, -- Do not hide dotfiles (e.g., .gitignore)
                        hide_gitignored = false, -- Do not hide gitignored files
                    },
                },
            })
            
            vim.keymap.set({'n','x'}, '<C-n>', ':Neotree filesystem reveal left<CR>', {})
            vim.keymap.set({'n','x'}, '<C-m>', ':Neotree filesystem close<CR>', {})
            
        end
}
