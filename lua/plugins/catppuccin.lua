return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,

        opts = {
            integrations = {
                dashboard = true,
                flash = true,
                lsp_trouble = true,
                mini = true,
                neotree = true,
                noice = true,
                notify = true,
                telescope = {
                    enabled = true,
                    style = "bold"
                },
                treesitter = true,
            },
        },

        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
}