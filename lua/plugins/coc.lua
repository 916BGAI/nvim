return {
    {
        "neoclide/coc.nvim",
        branch = "master",
        build = "npm ci",
        enabled = vim.fn.executable("npm") == 1,
    },
}