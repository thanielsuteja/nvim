return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  init = function ()
    vim.cmd('colorscheme ayu')
  end
}
