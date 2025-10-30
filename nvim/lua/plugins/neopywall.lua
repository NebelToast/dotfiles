-- In lua/plugins/neopywal.lua
return {
  "RedsXDD/neopywal.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    use_wallust = true,
  },
  config = function(_, opts)
    require("neopywal").setup(opts)
    vim.cmd.colorscheme("neopywal")
  end,
}

