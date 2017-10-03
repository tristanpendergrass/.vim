" e.g. Capitalize("foo") -> "Foo"
function! Capitalize(str)
  return toupper(a:str[0]) . a:str[1:-1]
endfunction

" does three find and replaces, replacing the all-caps version of string with
" all-caps version of the replacement string, and so on for capitalized and
" non-capitalized versions of the string
function! FindAndReplace(searchFor, replaceWith)
  silent! exec '%s/' . toupper(a:searchFor)    . '/' . toupper(a:replaceWith)    . '/g'
  silent! exec '%s/' . Capitalize(a:searchFor) . '/' . Capitalize(a:replaceWith) . '/g'
  silent! exec '%s/' . a:searchFor             . '/' . a:replaceWith             . '/g'
  echomsg 'Replaced ' . a:searchFor . ' with ' . a:replaceWith . ', ' . Capitalize(a:searchFor) . ' with ' . Capitalize(a:replaceWith) . ', and ' . toupper(a:searchFor) . ' with ' . toupper(a:replaceWith)
endfunction
