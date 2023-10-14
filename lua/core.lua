vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.o.guifont = "RobotoMono Nerd Font:h14"

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.infercase = true
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = "menuone,noinsert,preview"

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

vim.keymap.set("n", "<S-u>", "<cmd>redo<CR>")
vim.keymap.set("n", "<leader>q", "q")
vim.keymap.set("n", "q", "<cmd>q<CR>")

vim.keymap.set("n", "<D-s>", ":w<CR>")
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("n", "<D-v>", '"+P')
vim.keymap.set("v", "<D-v>", '"+P')
vim.keymap.set("c", "<D-v>", "<C-R>+")
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli')

vim.keymap.set("n", "<leader>sl", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>sj", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>sk", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>sh", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>ss", "<C-w>v")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sq", "<cmd>close<CR>")

vim.keymap.set("n", "tt", "<cmd>tabnew<CR>")   -- open new tab
vim.keymap.set("n", "tq", "<cmd>tabclose<CR>") -- close tab
vim.keymap.set("n", "to", "<cmd>tabo<CR>")     -- close other tabs
vim.keymap.set("n", "tn", "<cmd>tabn<CR>")     -- go to next tab
vim.keymap.set("n", "<tab>", "<cmd>tabn<CR>")  -- go to next tab
vim.keymap.set("n", "tp", "<cmd>tabp<CR>")     -- previous tab

vim.keymap.set("n", "z", "<cmd>ter<cr>i")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>chx", "<cmd>!chmod a+x %<CR>")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded"
  }
)
vim.diagnostic.config({
  update_in_insert = true,
  float = {
    border = "rounded"
  }
})

vim.api.nvim_set_hl(0, "FloatBoarder", { link = "Normal" })
