return {

  {
	"nvim-mini/mini.surround",
	event = "VeryLazy",
	opts = {},
  },


  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics workspace",
      },
      {
        "<leader>xd",
        "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
        desc = "Diagnostics buffer",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<CR>",
        desc = "Quickfix list",
      },
      {
        "<leader>xr",
        "<cmd>Trouble lsp_references toggle<CR>",
        desc = "LSP references",
      },
      {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false<CR>",
        desc = "Document symbols",
      },
    },
  },
}
