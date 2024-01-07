return {
    {
        "lunarvim/bigfile.nvim",
        event = { "FileReadPre", "BufReadPre", "User FileOpened" },

        opts = {
            filesize = 2,
            features = {
                "indent_blankline",
                "illuminate",
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
                "vimopts",
                "filetype",
            },
        },
    },
}
