local M = {}

--[[ M.capture_word =  ]]

local function get_translation_key()
  local translation_key_pattern = "([\"'])(.-)%1.tr()"

  -- Get the current line and cursor position
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Lua is 1-indexed

  -- Find the beginning and end of the word
  local start_col, end_col, _, translation_key = string.find(line, translation_key_pattern)

  -- If found, capture and return the text
  if start_col and end_col and col > start_col and col < end_col then
    -- return string.sub(line, start_col, end_col)
    return translation_key
  end

  -- "transltoa".tr()

  return nil -- Return nil if not found
end

-- Command to execute the capture
-- vim.cmd("command! CaptureText lua print(capture_text())")

vim.keymap.set('n', '<leader>ey', function()
  local key = get_translation_key()
  print(key)
end)

return M
