require "nvchad.options"

vim.opt.expandtab = false
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.foldcolumn = '1'
vim.o.foldmethod = 'manual'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = '1'
vim.opt.colorcolumn = { 80 }



vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400



vim.filetype.add({
  extension = {
    h = "c",
    hpp = "cpp",
    tpp = "cpp",
    ipp = "cpp",
  },
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
