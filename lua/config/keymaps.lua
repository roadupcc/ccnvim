-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<TAB>", ":><CR>", { desc = "add indent", silent = true })
map("i", "<TAB>", ":><CR>", { desc = "add indent", silent = true })

map("i", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })
map("n", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })
map("v", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })

map("n", "q", ":q<CR>", { desc = "Quit" })

map("n", "<leader>gdf", ":DiffviewOpen<CR>", { desc = "open diff window" })
