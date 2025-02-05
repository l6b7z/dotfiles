
local wk = require("which-key")
local OPTS = { noremap = true, silent = true }

vim.g.mapleader = " "

--unbind
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")


vim.keymap.set("n","<F7>",":w<CR>:!gcc -o output %<CR>:!./output > $(cat /tmp/vimTTY)<CR>")
vim.keymap.set("n","<F8>",":w<CR>:!clear > $(cat /tmp/vimTTY)<CR>:!./% > $(cat /tmp/vimTTY)<CR>")
-- vim.keymap.set("n","<F8>",":w<CR>:TermExec cmd=\"clear\"<CR>:!./% > $(cat /tmp/vimTTY)<CR>")
vim.keymap.set("n","<F9>",":ToggleTerm<CR>")
vim.keymap.set("n","<F10>",":TermExec cmd=\"tty > /tmp/vimTTY\"<CR>")


-- add empty line up and down shift enter and backspace
vim.keymap.set("n", "<S-CR>",  "o<ESC>k")
vim.keymap.set("n", "<C-H>",  "O<ESC>j")

-- save file
vim.keymap.set("n", "<C-s>",   ":w!<CR>")
vim.keymap.set("i", "<C-s>",   "<ESC>l:w!<CR>i")
vim.keymap.set("v", "<C-s>",   ":w!<CR>")

-- Move line / slected lines
-- vim.keymap.set("v", "<M-up>",   ":m '<-2<CR>gv=gv",OPTS)
-- vim.keymap.set("v", "<M-down>", ":m '>+1<CR>gv=gv",OPTS)
-- vim.keymap.set("n", "<M-up>",   ":m -2<CR>",OPTS)
-- vim.keymap.set("n", "<M-down>", ":m +1<CR>",OPTS)
vim.keymap.set("v", "<M-k>",   ":m '<-2<CR>gv=gv",OPTS)
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv",OPTS)
vim.keymap.set("n", "<M-k>",   ":m -2<CR>",OPTS)
vim.keymap.set("n", "<M-j>", ":m +1<CR>",OPTS)


-- Keeps cursor on the left
vim.keymap.set("n", "J", "mzJ`z")


-- Center cursor when moving / nexting search results
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Guide
vim.keymap.set("n","<F1>", "<cmd>WhichKey<CR>")
vim.keymap.set("v","<F1>", "<cmd>WhichKey<CR>")
vim.keymap.set("i","<F1>", "<cmd>WhichKey<CR>")


-- Comment Toggle
vim.keymap.set("n", "<C-_>", ":CommentToggle<CR>")
vim.keymap.set("v", "<C-_>", ":CommentToggle<CR>")

-- WhiteSpace characters Toggle
wk.register({mode = "v",["<leader>`"] = {":set list!<CR>","toggle whitespace visible" }})
wk.register({mode = "n",["<leader>`"] = {":set list!<CR>","toggle whitespace visible" }})

-- Search Results Toggle
wk.register({["<leader>h"] = {":set hlsearch!<CR>","toggle search results" }})

-- Search and Replace
wk.register({mode = "v",["<leader>"] = {
    r = {name = "replace",

    h = {":s///g<left><left><left>","selected"}},},})


-- Multi Line -> leader = \
--
--https://github.com/mg979/vim-visual-multi
--

