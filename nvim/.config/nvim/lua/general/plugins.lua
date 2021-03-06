local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", packer_path })
end
local mason_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/mason.nvim"
if vim.fn.empty(vim.fn.glob(mason_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/williamboman/mason.nvim.git", mason_path })
end

_G.plugins = {
  "wbthomason/packer.nvim",
  "williamboman/mason.nvim",

  "kyazdani42/nvim-web-devicons",
  "navarasu/onedark.nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
  "numtostr/fterm.nvim",

  "ahmedkhalf/project.nvim",
  "lewis6991/gitsigns.nvim",
  "akinsho/git-conflict.nvim",

  "ghillb/cybu.nvim",
  "kyazdani42/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",

  "utilyre/barbecue.nvim",
  "nvim-lualine/lualine.nvim",

  "lukas-reineke/indent-blankline.nvim",
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",

  "l3mon4d3/luasnip",
  "utilyre/spoon.nvim",

  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  "smiteshp/nvim-navic",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
}
