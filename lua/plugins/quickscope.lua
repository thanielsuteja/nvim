return {
  'unblevable/quick-scope',
  lazy = false,
  config = function()
    vim.cmd [[
      highlight QuickScopeSecondary guifg='#548AF7' gui=underline
      highlight QuickScopePrimary guifg='#5fffff' gui=underline
    ]]
  end
}
