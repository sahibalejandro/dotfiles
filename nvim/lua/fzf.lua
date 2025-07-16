--- Opens fzf in a new terminal buffer using the given title,
--- the results of input_command are fed to fzf for options.
--- The selected item is passed to the callback.
---@param input_command string
---@param title string
---@param callback function
function open_fzf(input_command, title, callback)
  local tmp_file = vim.fn.tempname()

  -- TODO:
  -- Save the current buffer name
  -- After closing terminal buffer, set the alternate buffer
  -- to the one what was previously saved

  vim.cmd('terminal '..input_command..' | fzf > '..tmp_file)
  vim.api.nvim_buf_set_name(0, title)
  vim.cmd('startinsert')

  vim.api.nvim_create_autocmd('TermClose', {
    buffer = 0,
    once = true,
    callback = function()
      local ok, lines = pcall(vim.fn.readfile, tmp_file)
      vim.loop.fs_unlink(tmp_file)
      vim.api.nvim_buf_delete(0, { force = true })

      if ok and #lines > 0 then
        pcall(callback, lines[1])
      end
    end
  })
end

function edit_file(file_path)
  vim.cmd('e '..file_path)
  vim.cmd('filetype detect')
end

function get_buffer_file_paths()
  local buffer_ids = vim.api.nvim_list_bufs()
  local file_paths = {}

  for i, buffer_id in ipairs(buffer_ids) do
    if vim.api.nvim_buf_is_loaded(buffer_id) then
      local relative_file_path = string.gsub(vim.api.nvim_buf_get_name(buffer_id), vim.fn.getcwd()..'/', '')
      table.insert(file_paths, relative_file_path)
    end
  end

  return file_paths
end

function find_file()
  open_fzf('rg --files', 'Find files in '..vim.fn.getcwd(), edit_file)
end

function find_open_buffer()
  local file_paths = table.concat(get_buffer_file_paths(), "\\n")

  if file_paths == '' then
    print('No available buffers')
  else
    open_fzf('echo "'..file_paths..'"', 'Find buffers', edit_file)
  end
end

vim.keymap.set('n', '<space>f', find_file)
vim.keymap.set('n', '<space>o', find_open_buffer)
