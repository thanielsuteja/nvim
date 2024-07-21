return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["L"] = "actions.select",
      ["H"] = "actions.parent",
      ["<C-d>"] = "actions.preview_scroll_down",
      ["<C-u>"] = "actions.preview_scroll_up",
      -- ["<C-l>"] = { "actions.preview", opts = { vertical = true, split = "belowright" }, desc = "Open preview vertically" },
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
