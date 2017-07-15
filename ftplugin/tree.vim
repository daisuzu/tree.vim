if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal buftype=nowrite bufhidden=delete noswapfile
setlocal concealcursor=n conceallevel=3
setlocal foldmethod=marker foldtext=tree#foldtext()
setlocal nowrap nonumber
setlocal shiftwidth=2

let b:undo_ftplugin = 'setl bt< bh< swf< cocu< cole< fdm< fdt< wrap< nu< sw<'

" vim:set sw=2 sts=2 et:
