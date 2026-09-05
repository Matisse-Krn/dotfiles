local default = require("nvchad.configs.lspconfig")

local group = vim.api.nvim_create_augroup("custom_lsp", { clear = true })

local function get_root()
  local bufname
  local start
  local found

  bufname = vim.api.nvim_buf_get_name(0)
  if bufname ~= "" then
    start = vim.fs.dirname(bufname)
  else
    start = vim.fn.getcwd()
  end

  found = vim.fs.find({ "compile_commands.json", ".git", "Makefile" }, {
    upward = true,
    path = start,
  })[1]

  if found then
    return vim.fs.dirname(found)
  end
  return vim.fn.getcwd()
end

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "cpp", "c" },
  callback = function()
    vim.lsp.start({
      name = "clangd",
      cmd = {
        "clangd",
        "--background-index",
        "--completion-style=detailed",
      },
      root_dir = get_root(),
      on_attach = default.on_attach,
      on_init = default.on_init,
      capabilities = default.capabilities,
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "html",
  callback = function()
    vim.lsp.start({
      name = "html",
      cmd = { "vscode-html-language-server", "--stdio" },
      root_dir = get_root(),
      on_attach = default.on_attach,
      on_init = default.on_init,
      capabilities = default.capabilities,
    })
  end,
})
