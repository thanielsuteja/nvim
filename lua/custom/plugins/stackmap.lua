local M = {}

-- M.setup = function(opts)
--   print("Options: ", opts)
-- end

-- functions we need:
-- - vim.keymap.set(...) -> create keymap settings
-- - nvim_get_keymap
--    vim.api.nvim_get_keymap(...)

-- consider it as a cache
M._stack = {}

local find_mapping = function(maps, lhs)
  for _, value in ipairs(maps) do
    if value.lhs == lhs then
      return value
    end
  end
end

M.push = function(name, mode, mappings)
  local maps = vim.api.nvim_get_keymap(mode)

  local existing_maps = {}
  for lhs, _ in pairs(mappings) do
    local existing = find_mapping(maps, lhs)

    -- truthies are everything except only "nil" and "false"
    if existing then
      existing_maps[lhs] = existing
    end
  end

  M._stack[name] = {
    mode = mode,
    existing = existing_maps,
    mappings = mappings,
  }

  for lhs, rhs in pairs(mappings) do
    vim.keymap.set(mode, lhs, rhs)
  end
end

M.pop = function(name)
  local state = M._stack[name]
  M._stack[name] = nil

  for lhs, _ in pairs(state.mappings) do
    if state.existing[lhs] then
      -- handle mappings that existed
      vim.keymap.set(state.mode, lhs, state.existing[lhs].rhs)
    else
      -- handled mappings that didn't exists
      vim.keymap.del(state.mode, lhs)
    end
  end

  -- if state.existing then
  --   table.insert(existing_maps, existing)
  -- end
end

M.push("debug_mode", "n", {
  [" st"] = "echo 'Hello'",
  [" pv"] = "echo 'OILY matey'",
})

M._clear = function ()
  M._stack = {}
end

return M
