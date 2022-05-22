local reach = require("reach")

reach.setup({
  notifications = false,
})

vim.keymap.set("n", "<tab>", function()
  reach.buffers({
    handle = "dynamic",
    show_current = true,
    modified_icon = "[+]",
    previous = {
      enable = true,
      chars = { "-" },
    },
  })
end)
