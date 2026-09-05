return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = " ",
          sorting_strategy = "ascending",

          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--no-ignore",
            "--glob",
            "!*.o",
            "--glob",
            "!*.d",
            "--glob",
            "!*.json",
          },

          file_ignore_patterns = {
            "%.o$",
            "%.d$",
            "%.json$",
          },

          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },

          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
            },
          },
        },

        pickers = {
          find_files = {
            no_ignore = true,
            hidden = true,
          },

          live_grep = {
            additional_args = function()
              return {
                "--case-sensitive",
                "--no-ignore",
                "--glob",
                "!*.o",
                "--glob",
                "!*.d",
                "--glob",
                "!*.json",
              }
            end,
          },
        },
      })
    end,
  },
}
