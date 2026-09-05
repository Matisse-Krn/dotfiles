require "nvchad.mappings"


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- My mappings
map("n", "<leader><Down>", "yyp", { desc = "Duplicate line below" })
map("n", "<leader><Up>", "yyP", { desc = "Duplicate line above" })

map("n", "<leader><Down>", "yyp", { desc = "Duplicate line below" })
map("n", "<A-Down>", ":m +1<CR>", { desc = "Move line down" })
map("n", "<A-Up>", ":m -2<CR>", { desc = "Move line up" })

-- Hover LSP stylé
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc (Lspsaga)" })
-- Épingler la doc (fenêtre persistante en haut-droite)
map("n", "gK", "<cmd>Lspsaga hover_doc ++keep<CR>", { desc = "Hover doc keep" })

map("n", "gd","<cmd>Lspsaga goto_definition<CR>", {desc ="Go to definition"})
map("n", "ge", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Floating code error" })






map("n", "<leader>sf", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", { desc = "Search files" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "Search word" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search buffers" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "Resume Telescope" })






-- Quickfix
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
map("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })

-- Location list
map("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open loclist" })
map("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close loclist" })
map("n", "<leader>ln", "<cmd>lnext<CR>", { desc = "Next loclist item" })
map("n", "<leader>lp", "<cmd>lprev<CR>", { desc = "Previous loclist item" })

-- Makefile
map("n", "<leader>mm", "<cmd>make<CR>", { desc = "Make" })
map("n", "<leader>mr", "<cmd>make re<CR>", { desc = "Make re" })
map("n", "<leader>mc", "<cmd>make clean<CR>", { desc = "Make clean" })
map("n", "<leader>mf", "<cmd>make fclean<CR>", { desc = "Make fclean" })

-- Format
map("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Compile and run current C file
map("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")
  local ft = vim.bo.filetype
  local cmd

  if ft == "c" then
    cmd = "cc -Wall -Wextra -Werror -g3 "
      .. vim.fn.shellescape(file)
      .. " -o "
      .. vim.fn.shellescape(output)
      .. " && "
      .. vim.fn.shellescape(output)
  elseif ft == "cpp" then
    cmd = "c++ -Wall -Wextra -Werror -g3 -std=c++98 "
      .. vim.fn.shellescape(file)
      .. " -o "
      .. vim.fn.shellescape(output)
      .. " && "
      .. vim.fn.shellescape(output)
  else
    vim.notify("Not a C/C++ file", vim.log.levels.WARN)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end, { desc = "Compile and run current C/C++ file" })

-- LSP
map("n", "gr", "<cmd>Lspsaga finder ref<CR>", { desc = "LSP references" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code action" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Diagnostic float" })

-- Buffers
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
