
return {
    -- Markdown editing plugin
    {
        "preservim/vim-markdown",
        config = function()
            -- Configure vim-markdown options
            vim.g.vim_markdown_folding_disabled = 1  -- Disable folding
            vim.g.vim_markdown_conceal = 0           -- Disable conceal feature
            vim.g.vim_markdown_frontmatter = 1       -- Enable frontmatter highlighting

            -- Example: Set custom keybindings for Markdown
            vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
        end,
    },
    -- Markdown preview plugin
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        config = function()
            vim.g.mkdp_auto_start = 0  -- Don't start preview automatically
            vim.g.mkdp_auto_close = 1  -- Close preview window when Neovim is closed
        end,
    },
    -- Markdown LSP configuration
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Setup for Markdown LSP server
            lspconfig.marksman.setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            -- Additional settings for Markdown LSP
            vim.keymap.set("n", "<leader>md", vim.lsp.buf.definition, { desc = "[M]arkdown Goto [D]efinition" })
            vim.keymap.set("n", "<leader>mh", vim.lsp.buf.hover, { desc = "[M]arkdown Hover Documentation" })
            vim.keymap.set({ "n", "v" }, "<leader>ma", vim.lsp.buf.code_action, { desc = "[M]arkdown [A]ctions" })
        end,
    },
}
