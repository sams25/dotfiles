vim.cmd [[
  augroup _RmdSpecific
    autocmd!
    autocmd FileType rmd setlocal makeprg=$HOME/.scripts/makenotes\ %
    autocmd FileType rmd setlocal errorformat=%f:%l:%c:\ %t%n\ %m
  augroup end
]]
