-- create code images
local opts = {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  keys = {
    { "<leader>S", group = "Silicon", mode = { "v" } },
    {
      "<leader>Sc",
      function()
        require("nvim-silicon").clip()
      end,
      desc = "Copy code screenshot to clipboard",
      mode = { "v" },
    },
    {
      "<leader>Sf",
      function()
        require("nvim-silicon").file()
      end,
      desc = "Save code screenshot as file",
      mode = { "v" },
    },
    {
      "<leader>Ss",
      function()
        require("nvim-silicon").shoot()
      end,
      desc = "Create code screenshot",
      mode = { "v" },
    },
  },
  opts = {
    font = "FiraCode Nerd Font Mono=34;Noto Color Emoji=34",
    theme = "GitHub",
    background = "#fff",
    pad_horiz = 10,
    pad_vert = 10,
  },
}
return opts
