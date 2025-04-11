return {
    'akinsho/toggleterm.nvim', 
     version = "*", 
    vim.keymap.set({'n','x'}, '<C-t>', ':ToggleTerm size=25 direction=horizontal<CR>', {}),
    config = function ()
        require("toggleterm").setup()
     end
}
