function dedupe_quickfix()
  local qf_list = vim.fn.getqflist()
  local seen = {}
  local unique_list = {}

  for _, item in ipairs(qf_list) do
    -- Create a unique key based on file and line number
    local key = item.bufnr .. ":" .. item.lnum
    if not seen[key] then
      table.insert(unique_list, item)
      seen[key] = true
    end
  end

  vim.fn.setqflist(unique_list, 'r')
  print("Quickfix deduplicated: " .. #qf_list - #unique_list .. " items removed.")
end

-- Keymap to trigger deduplication (e.g., <leader>qd)
vim.keymap.set('n', '<leader>qd', dedupe_quickfix, { desc = 'Deduplicate quickfix list' })
