return {
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = {
            mode = "loclist",
        },

        keys = {
            { "<leader>x", [[<Cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><Cmd>Trouble loclist<CR>]] },
            { "<leader>xx", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble Location List (Trouble)" },
        },
    },
}