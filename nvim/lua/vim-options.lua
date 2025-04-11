vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")

vim.cmd([[
  autocmd BufRead,BufNewFile *.jsx,*.tsx set filetype=typescriptreact
]])

vim.opt.clipboard:append { 'unnamedplus'}

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight clear CursorLine 
      highlight LineNr guifg=#5F9EA0
      highlight CursorLineNr cterm=bold gui=bold guifg=#9370DB
      highlight MsgArea guifg=#D16BFF
    ]])
  end,
})


-- Basic Keymaps
local keymap = vim.keymap


-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

--New tab 
keymap.set('n', 'te', ':tabedit<Return>', {silent=true})

--Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent=true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent=true})

--Move window

keymap.set('n', 'w', '<C-w>w')
keymap.set('', 's<left>', 'C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')


-- vim.api.nvim_set_keymap('n', '<Leader>ccc', [[:w !xsel --clipboard<CR><CR>]], {noremap = true, silent = true})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.bo.commentstring = "// %s"
  end
})
