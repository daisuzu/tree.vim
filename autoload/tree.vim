function! tree#open(dir, depth, bang, mods) abort
  let opt_a = a:bang ? '-a' : ''
  let depth = a:depth > 0 ? a:depth : g:tree_max_depth
  let root = fnamemodify(a:dir !=# '' ? a:dir : '.', ':p:h')
  let tree = json_decode(system('tree ' . g:tree_options . ' ' . opt_a . ' -L ' . depth . ' -J ' . root))

  execute a:mods . ' new'
  call setline(1, extend([s:path_join(root, '..', ''), s:path_join(root, '.', '')], s:make_tree(root, tree[0].contents, 0)))
  setfiletype tree
endfunction

function! tree#foldtext() abort
  let text = s:path_join(split(getline(v:foldstart), '/')[-2], '')
  return s:add_indent(text, v:foldlevel - 1)
endfunction

function! s:path_join(...) abort
  return join(a:000, '/')
endfunction

function! s:add_indent(text, count) abort
  return repeat('  ', a:count) . a:text
endfunction

function! s:make_tree(root, contents, level) abort
  let result = []
  for c in a:contents
    let path = s:path_join(a:root, c.name)
    let result = add(result, s:add_indent(path, a:level))
    if c.type ==# 'directory'
      let result[-1] = s:path_join(result[-1], '{{{')
      call extend(result, s:make_tree(path, c.contents, a:level + 1))
      let result[-1] = result[-1] . '}}}'
    endif
  endfor
  return result
endfunction

" vim:set sw=2 sts=2 et:
