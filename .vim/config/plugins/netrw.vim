" suppress the banner
let g:netrw_banner = 0

" do network file transfers silently
let g:netrw_silent = 1

" make symlink highlighting bearable on tty
highlight clear netrwSymlink
highlight link netrwSymlink Special

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
