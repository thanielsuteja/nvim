return {
  'stevearc/oil.nvim',
  opts = {
    use_default_keymaps = false,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
      -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      -- ["<C-l>"] = "actions.refresh",

      ["L"] = "actions.select",
      ["H"] = "actions.parent",
      ["K"] = "actions.preview_scroll_up",
      ["J"] = "actions.preview_scroll_down",
      -- ["<C-d>"] = "actions.preview_scroll_down",
      -- ["<C-u>"] = "actions.preview_scroll_up",
      ["<C-;>"] = { "actions.preview", desc = "Open preview vertically" },
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
