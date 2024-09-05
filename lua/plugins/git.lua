return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local icons = require("config.icons")
            -- setup gitsigns
            require("gitsigns").setup({
                signs = {
                    add = { text = icons.ui.BoldLineMiddle },
                    change = { text = icons.ui.BoldLineDashedMiddle },
                    delete = { text = icons.ui.TriangleShortArrowRight },
                    topdelete = { text = icons.ui.TriangleShortArrowRight },
                    changedelete = { text = icons.ui.BoldLineMiddle },
                },
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                update_debounce = 200,
                max_file_length = 40000,
                preview_config = {
                    border = "rounded",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
            })
            -- Set up highlights
            vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
            vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
            vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
            vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
            vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
            -- Set a vim motion to <Space> + g + h to preview changes to the file under the cursor in normal mode
            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk" })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            -- Set a vim motion to <Space> + g + b to view the most recent contributors to the file
            vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "[G]it [B]lame" })
            -- Set a vim motion to <Space> + g + <Shift>A to add all files changed to the staging area
            vim.keymap.set("n", "<leader>gA", ":Git add .<CR>", { desc = "[G]it Add [A]ll" })
            -- Set a vim motion to <Space> + g + a to add the current file and changes to the staging area
            vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", { desc = "[G]it [A]dd current file" })
            -- Set a vim motion to <Space> + g + c to commit the current changes
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "[G]it [C]ommit" })
            -- Set a vim motion to <Space> + g + p to push the committed changes to the remote repository
            vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[G]it [P]ush" })
        end,
    },
}
