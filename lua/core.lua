vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.o.guifont = "RobotoMono Nerd Font:h14"

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.nu = true
vim.opt.updatetime = 50

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

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

-- vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

local k = vim.keymap.set
local n = function(...) k("n", ...) end
local v = function(...) k("v", ...) end
local i = function(...) k("i", ...) end
local t = function(...) k("t", ...) end
local c = function(...) k("c", ...) end

n("<S-u>", "<cmd>redo<CR>")
n("<leader>q", "<cmd>q<CR>")
n("<leader>ww", "<cmd>w<CR>")
n("<leader>wa", "<cmd>wa<CR>")

n("v", "V")
n("V", "v")

v("J", ":m '>+1<CR>gv=gv")
v("K", ":m '>-2<CR>gv=gv")

v("p", "\"_dP")
n("<leader>p", "\"+p")
n("<leader>yy", "\"+yy")
v("<leader>y", "\"+y")

n("<D-s>", ":w<CR>")
v("<D-c>", '"+y')
n("<D-v>", '"+P')
v("<D-v>", '"+P')
c("<D-v>", "<C-R>+")
i("<D-v>", '<ESC>l"+Pli')

k({ "n", "v", "i" }, "<C-L>", "<cmd>wincmd l<CR>")
k({ "n", "v", "i" }, "<C-J>", "<cmd>wincmd j<CR>")
k({ "n", "v", "i" }, "<C-K>", "<cmd>wincmd k<CR>")
k({ "n", "v", "i" }, "<C-H>", "<cmd>wincmd h<CR>")
n("<leader>ss", "<C-w>v")
n("<leader>se", "<C-w>=")
n("<leader>sq", "<cmd>close<CR>")

n("tt", "<cmd>tab split<CR>")            -- open new tab
n("<leader><tab>", "<cmd>tab split<CR>") -- new tab
n("tq", "<cmd>tabclose<CR>")             -- close tab
n("to", "<cmd>tabo<CR>")                 -- close other tabs
n("tn", "<cmd>tabn<CR>")                 -- go to next tab
n("<tab>", "<cmd>tabn<CR>")              -- go to next tab
n("<S-tab>", "<cmd>tabp<CR>")            -- go to next tab
n("tp", "<cmd>tabp<CR>")                 -- previous tab

t("<Esc>", "<C-\\><C-n>")

n("<leader>chx", "<cmd>!chmod a+x %<CR>")

n("<C-.>", vim.lsp.buf.code_action)
n("<C-Space>", vim.lsp.buf.code_action)
n("K", vim.lsp.buf.hover)
n("gr", vim.lsp.buf.references)
n("<leader>r", vim.lsp.buf.rename)
n("gd", vim.lsp.buf.declaration)
n("gK", vim.lsp.buf.signature_help)

local motion = function(key)
  i("<C-" .. key .. ">", "<C-o>" .. key)
end

motion("h")
motion("j")
motion("k")
motion("l")
motion("p")
motion("o")
motion("w")
motion("b")
motion("u")
motion("$")
motion("^")
motion("0")


vim.api.nvim_set_hl(0, "FloatBoarder", { link = "Normal" })

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


-- Taken from lunarvim

vim.api.nvim_create_augroup("_general_settings", {})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = "_general_settings",
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})
