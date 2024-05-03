--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'globals'

-- [[ Install lazy.nvim ]]
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require 'lazy-plugins'

-- [[ Setting keymaps ]]
require 'keymaps'

-- [[ Setting options ]]
require 'options'

-- [[ Configure telescope ]]
require 'telescope-setup'

-- [[ Configure Treesitter ]]
require 'treesitter-setup'

-- [[ Configure LSP ]]
require 'lsp-setup'

-- [[ Configure nvim-cmp ]]
require 'cmp-setup'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
