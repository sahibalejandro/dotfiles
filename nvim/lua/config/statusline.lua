function zero_get_branch()
  if not vim.loop.fs_stat('.git') then
    return ''
  end

  local ok, branch = pcall(vim.fn.system, 'git branch --show-current')
  if not ok then
    return ''
  end

  return '@'..vim.trim(branch)
end

local function set_statusline(left_hl_group, right_hl_group, scope)
  scope.statusline = '%#'..left_hl_group..'#%f %m%r%h%w%q %#StatusLineNC#%{%v:lua.zero_get_branch()%}%#'..right_hl_group..'#%=%-14.(%l,%c%V%) %P'
end

vim.api.nvim_create_autocmd('WinEnter', {
  callback = function(event)
    set_statusline('CustomStatusLine', 'StatusLine', vim.wo)
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  callback = function(event)
    set_statusline('CustomStatusLineNC', 'StatusLineNC', vim.wo)
  end,
})

vim.cmd('hi StatusLine guibg=none')
vim.cmd('hi StatusLineNC guibg=none guifg=#555977')
vim.cmd('hi CustomStatusLine guifg=#f3af4a')
vim.cmd('hi CustomStatusLineNC guifg=default')

set_statusline('CustomStatusLine', 'StatusLine', vim.o)
