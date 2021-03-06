local barbecue = require("barbecue")
local lualine = require("lualine")

barbecue.setup({
  separator = " " .. _G.icons.ui.Chevron .. " ",
  icons = {
    File = _G.icons.kind.File .. " ",
    Package = _G.icons.kind.Folder .. " ",
    Module = _G.icons.kind.Module .. " ",
    Namespace = _G.icons.kind.Module .. " ",
    Class = _G.icons.kind.Class .. " ",
    Constructor = _G.icons.kind.Constructor .. " ",
    Field = _G.icons.kind.Field .. " ",
    Property = _G.icons.kind.Property .. " ",
    Method = _G.icons.kind.Method .. " ",
    Struct = _G.icons.kind.Struct .. " ",
    Event = _G.icons.kind.Event .. " ",
    Interface = _G.icons.kind.Interface .. " ",
    Enum = _G.icons.kind.Enum .. " ",
    EnumMember = _G.icons.kind.EnumMember .. " ",
    Constant = _G.icons.kind.Constant .. " ",
    Function = _G.icons.kind.Function .. " ",
    TypeParameter = _G.icons.kind.TypeParameter .. " ",
    Variable = _G.icons.kind.Variable .. " ",
    Operator = _G.icons.kind.Operator .. " ",
    Null = _G.icons.type.Null .. " ",
    Boolean = _G.icons.type.Boolean .. " ",
    Number = _G.icons.type.Number .. " ",
    String = _G.icons.type.String .. " ",
    Key = _G.icons.type.String .. " ",
    Array = _G.icons.type.Array .. " ",
    Object = _G.icons.type.Object .. " ",
  },
})

lualine.setup({
  options = {
    globalstatus = true,
    section_separators = { left = _G.icons.ui.SectionLeft, right = _G.icons.ui.SectionRight },
    component_separators = { left = _G.icons.ui.ComponentLeft, right = _G.icons.ui.ComponentRight },
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics",
        update_in_insert = true,
        symbols = {
          error = _G.icons.diagnostic.Error .. " ",
          warn = _G.icons.diagnostic.Warn .. " ",
          hint = _G.icons.diagnostic.Hint .. " ",
          info = _G.icons.diagnostic.Info .. " ",
        } },
    },
    lualine_c = {
      { function()
        local names = vim.tbl_remove(vim.tbl_keys(_G.terminals), _G.lastname)
        return (_G.lastname or "") .. table.concat(names)
      end },
    },
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
  },
})
