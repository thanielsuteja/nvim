return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          symbols = {
            modified = '●',
          }
        }
      },
      lualine_x = {
        {
          'branch',
          icon = ''
        }
      },
      lualine_y = {
        {
          'diff',
          symbols = {
            added = ' ', modified = '󰝤 ', removed = ' '
          }
        },
        'diagnostics',
      },
      lualine_z = { 'encoding' }
    }
  }
}
