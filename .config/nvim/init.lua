-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Configure Black formatter with a line length of 120
vim.g.black_linelength = 120

-- Enable format on save
--vim.cmd [[
--  augroup FormatAutogroup
--    autocmd!
--    autocmd BufWritePost *.py execute ':Black'
--  augroup END
--]]
