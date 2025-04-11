return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                auto_install = true,
                ensure_installed = { "c", "sql", "rust", "cpp", "cuda", "python", "go", "ruby", "java", "bash", "lua", "vim", "vimdoc", "elixir", "ocaml", "typescript", "tsx", "javascript", "json", "yaml", "html", "css", "zig", "dockerfile" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter" },
        config = function()
          require("nvim-ts-autotag").setup()
        end
    }
}

