local treesitter = require("nvim-treesitter.configs")
local indentblankline = require("indent_blankline")

treesitter.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
})

indentblankline.setup({
  show_current_context = true,
})