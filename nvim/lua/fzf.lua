local function fzf(opts)
  vim.api.nvim_create_autocmd('TermClose', {
    once = true,
    callback = function()
      if vim.v.event.status ~= 0 then
        vim.cmd('bd!')
      else
        local lines = vim.api.nvim_buf_get_lines(0, 0, 1, false)
        vim.cmd('bd!')
        opts.on_select(lines[1])
      end
    end,
  })

  vim.cmd('terminal ' .. opts.source .. '|fzf ' .. (opts.fzf_opts or ''))
  vim.cmd('startinsert')
end

local function edit_file(selected_file)
    vim.cmd('e ' .. selected_file)
    vim.cmd('filetype detect')
  end

local function find_file()
  fzf({
    source = 'rg --files',
    on_select = edit_file,
  })
end

vim.keymap.set('n', '<space>f', find_file)
