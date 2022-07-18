local lsp = require("lspconfig")
local installer = require("nvim-lsp-installer")
local null = require("null-ls")
local navic = require("nvim-navic")
local cmp = require("cmp_nvim_lsp")

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  float = { border = "rounded" },
  signs = {
    active = {
      vim.api.nvim_create_sign("DiagnosticSignError", vim.g.symbols.diagnostic.Error),
      vim.api.nvim_create_sign("DiagnosticSignWarn", vim.g.symbols.diagnostic.Warn),
      vim.api.nvim_create_sign("DiagnosticSignHint", vim.g.symbols.diagnostic.Hint),
      vim.api.nvim_create_sign("DiagnosticSignInfo", vim.g.symbols.diagnostic.Info),
    },
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local on_attach = function(client, buffnr)
  local gLsp = vim.api.nvim_create_augroup("Lsp", { clear = false })
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = gLsp,
      buffer = buffnr,
      callback = vim.get_hof(vim.lsp.buf.document_highlight),
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = gLsp,
      buffer = buffnr,
      callback = vim.get_hof(vim.lsp.buf.clear_references),
    })
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffnr)
  end

  vim.keymap.set("n", "<leader>id", vim.get_hof(vim.lsp.buf.definition), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ir", vim.get_hof(vim.lsp.buf.references), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ia", vim.get_hof(vim.lsp.buf.code_action), { buffer = buffnr })
  vim.keymap.set("n", "<leader>if", vim.get_hof(vim.lsp.buf.format, { async = true }), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ic", vim.get_hof(vim.lsp.buf.rename), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ih", vim.get_hof(vim.lsp.buf.hover), { buffer = buffnr })
  vim.keymap.set("n", "<leader>il", vim.get_hof(vim.diagnostic.open_float), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ik", vim.get_hof(vim.diagnostic.goto_prev), { buffer = buffnr })
  vim.keymap.set("n", "<leader>ij", vim.get_hof(vim.diagnostic.goto_next), { buffer = buffnr })
end

installer.on_server_ready(function(server)
  server:setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })
end)

local get_sources = function()
  local config_path = vim.fn.expand("$NULL_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end

  local sources = {}
  local groups = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  for group, members in pairs(groups) do
    for member, options in pairs(members) do
      table.insert(sources, null.builtins[group][member].with(options))
    end
  end

  return sources
end

null.setup({
  sources = get_sources(),
  on_attach = on_attach,
})