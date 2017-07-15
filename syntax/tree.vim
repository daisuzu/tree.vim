if exists('b:current_syntax')
  finish
endif

syntax match TreeMarker "\({{{\|}}}\)" conceal
syntax match TreePath "^\s*\zs.*\/\ze[^\/{}]\+" conceal
syntax match TreeDir "[^\/]\+\/[{}]*$" contains=TreeMarker

highlight default link TreeDir Directory

let b:current_syntax = 'tree'

" vim:set sw=2 sts=2 et:
