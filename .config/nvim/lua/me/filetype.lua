vim.cmd [[
  augroup _RmdSpecific
    autocmd!
    autocmd FileType rmd setlocal makeprg=$HOME/.scripts/makenotes\ %
    autocmd FileType rmd setlocal errorformat=%f:%l:%c:\ %t%n\ %m
  augroup end
]]

vim.cmd [[
  augroup _LaTeXSpecific
    autocmd!
    autocmd FileType tex setlocal makeprg=$HOME/.scripts/makenotes\ %
    autocmd FileType tex setlocal errorformat=%f:%l:%c:\ %t%n\ %m
  augroup end
]]

vim.cmd [[
  augroup _MarkdownSpecific
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.pmd set filetype=markdown.pandoc
  augroup end
]]
