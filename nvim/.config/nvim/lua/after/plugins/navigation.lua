local reach = require("reach")
local tree = require("nvim-tree")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

reach.setup()

vim.keymap.set("n", "<tab>", vim.get_hof(reach.buffers, {
  show_current = true,
  handle = "dynamic",
  modified_icon = "[+]",
}))

tree.setup({
  update_cwd = true,
  git = { ignore = false },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  view = {
    width = 40,
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = {
        { key = "h", action = "close_node" },
        { key = { "l", "<2-leftmouse>" }, action = "edit" },
        { key = "r", action = "refresh" },
        { key = "d", action = "cut" },
        { key = "y", action = "copy" },
        { key = "p", action = "paste" },
        { key = "c", action = "rename" },
        { key = "x", action = "remove" },
        { key = "a", action = "create" },
      },
    },
  },
  renderer = {
    group_empty = true,
    symlink_destination = false,
    icons = {
      git_placement = "after",
      glyphs = {
        default = vim.g.symbols.document.File,
        symlink = vim.g.symbols.document.Link,
        folder = {
          arrow_closed = vim.g.symbols.ui.Closed,
          arrow_open = vim.g.symbols.ui.Open,
          symlink = vim.g.symbols.document.Link,
          default = vim.g.symbols.document.Folder,
          open = vim.g.symbols.document.Open,
          symlink_open = vim.g.symbols.document.Open,
          empty = vim.g.symbols.document.Empty,
          empty_open = vim.g.symbols.document.EmptyOpen,
        },
        git = {
          untracked = vim.g.symbols.git.Untracked,
          staged = vim.g.symbols.git.Added,
          unstaged = vim.g.symbols.git.Modified,
          renamed = vim.g.symbols.git.Renamed,
          deleted = vim.g.symbols.git.Deleted,
          unmerged = vim.g.symbols.git.Unmerged,
          ignored = vim.g.symbols.git.Ignored,
        },
      },
    },
  },
})

vim.keymap.set("n", "<c-_>", vim.get_hof(tree.toggle))

telescope.setup({
  defaults = themes.get_dropdown(),
})

vim.keymap.set("n", "<leader>fr", vim.get_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.get_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.get_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.get_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>fs", vim.get_hof(builtin.lsp_document_symbols))