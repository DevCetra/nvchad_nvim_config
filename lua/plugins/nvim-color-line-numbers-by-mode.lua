return {
  {
    "DevCetra/nvim-color-line-numbers-by-mode",
    lazy = false, --load during startup
    config = function()
      require("nvim-color-line-numbers-by-mode").setup()
    end,
  },
}
