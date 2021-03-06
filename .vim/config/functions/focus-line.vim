" Credit: https://bitbucket.org/sjl/dotfiles
" "Focus" the current line. Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
function! FocusLine() abort
  let l:save_pos = getpos('.')
  execute ":silent! normal zM"
  execute ":silent! normal zv"
  execute ":silent! normal zz"
  execute "normal! 15\<C-E>"
  call setpos('.', l:save_pos)
endfunction

command! FocusLine call FocusLine()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
