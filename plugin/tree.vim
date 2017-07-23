if exists('g:loaded_tree')
  finish
endif
let g:loaded_tree = 1

if !executable('tree')
  echoerr 'tree: command not found'
  finish
endif

let g:tree_max_depth = get(g:, 'tree_max_depth', 10)
let g:tree_options = get(g:, 'tree_options', '')

command! -nargs=? -complete=dir -count -bang -bar Tree call tree#open(<q-args>, <count>, <bang>0, <q-mods>)

" vim:set sw=2 sts=2 et:
