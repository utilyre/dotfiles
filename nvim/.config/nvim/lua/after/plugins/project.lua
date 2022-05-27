local project = require("project_nvim")
local dressing = require("dressing")
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local todo = require("todo-comments")
local whichkey = require("which-key")

project.setup({
  manual_mode = true,
})

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    telescope = themes.get_dropdown(),
  },
})

telescope.load_extension("projects")
telescope.setup({
  defaults = themes.get_dropdown(),
})

todo.setup({
  keywords = {
    FIX = { icon = vim.g.symbols.diagnostics.Fix },
    TODO = { icon = vim.g.symbols.diagnostics.Todo },
    HACK = { icon = vim.g.symbols.diagnostics.Hack },
    WARN = { icon = vim.g.symbols.diagnostics.Warn },
    PERF = { icon = vim.g.symbols.diagnostics.Perf },
    NOTE = { icon = vim.g.symbols.diagnostics.Note },
  },
})

whichkey.register({
  f = {
    name = "Find",
    p = { telescope.extensions.projects.projects, "Project" },
    r = { builtin.oldfiles, "Recent" },
    f = { builtin.find_files, "File" },
    w = { builtin.live_grep, "Word" },
  },
}, { prefix = "<leader>" })
