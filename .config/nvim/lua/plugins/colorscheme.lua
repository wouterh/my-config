return {
  {
    "projekt0n/github-nvim-theme",
    opts = {
      groups = {
        github_light = {
          Whitespace = { fg = "#BBBBBB" },
          Delimiter = { fg = "#953800" },
          FzfLuaFzfMatch = { fg = "MediumSpringGreen" },
        },
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)
    end,
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      colors = {
        hint = { "#10B981" },
      },
    },
  },

  -- Configure LazyVim to load github-theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light",
    },
  },
}
