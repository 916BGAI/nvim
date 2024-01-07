local catppuccinpath = vim.fn.stdpath("data") .. "/lazy/catppuccin"
vim.opt.rtp:prepend(catppuccinpath)
local mocha = require("catppuccin.palettes").get_palette "mocha"

return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",

        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
            { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
            { "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
            { "<leader>b]", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        },

        opts = {
            options = {
                close_command = function(n) require("mini.bufremove").delete(n, false) end,
                right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
                diagnostics = "coc",
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local ret = (diag.error and " " .. diag.error .. " " or "")
                    .. (diag.warning and " " .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get {
                styles = { "italic", "bold" },
                custom = {
                    all = {
                        fill = { bg = "#000000" },
                    },
                    mocha = {
                        background = { fg = mocha.text },
                    },
                    latte = {
                        background = { fg = "#000000" },
                    },
                },
            },
        },

        config = function(_, opts)
            require("bufferline").setup(opts)
            vim.api.nvim_create_autocmd("BufAdd", {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
}