function! PkgrSetup() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  " status
  call packager#add('itchyny/lightline.vim')

  " windows
  call packager#add('talek/obvious-resize')

  " buffers
  call packager#add('mihaifm/bufstop')

  " folds
  call packager#add('Konfekt/FastFold')
  call packager#add('Harenome/vim-neatfoldtext')

  " filesystem
  call packager#add('preservim/nerdtree', { 'type': 'opt' })

  " keyboard
  call packager#add('kana/vim-arpeggio', { 'type': 'opt' })
  call packager#add('drmikehenry/vim-fixkey')

  " search and replace
  call packager#add('dyng/ctrlsf.vim', { 'type': 'opt' })
  call packager#add('junegunn/fzf', { 'type': 'opt' })
  call packager#add('junegunn/fzf.vim', { 'type': 'opt' })
  call packager#add('t9md/vim-quickhl', { 'type': 'opt' })

  " movement
  call packager#add('rhysd/clever-f.vim')
  call packager#add('christoomey/vim-tmux-navigator')

  " repeat
  call packager#add('tpope/vim-repeat')

  " undo
  call packager#add('mbbill/undotree', { 'type': 'opt' })

  " surround
  call packager#add('tpope/vim-surround')

  " comments
  call packager#add('tpope/vim-commentary')

  " modelines
  call packager#add('ciaranm/securemodelines')

  " registers
  call packager#add('junegunn/vim-peekaboo')

  " align
  call packager#add('tommcdo/vim-lion', { 'type': 'opt' })
  call packager#add('t9md/vim-textmanip', { 'type': 'opt' })

  " narrow region
  call packager#add('atweiden/vim-viewport', { 'type': 'opt' })

  " command runners
  call packager#add('tpope/vim-tbone')

  " ex mode
  call packager#add('tyru/capture.vim', { 'type': 'opt' })

  " dvcs
  call packager#add('sjl/splice.vim', { 'type': 'opt' })

  " languages {{{

  " --- elixir {{{

  call packager#add('elixir-editors/vim-elixir', { 'type': 'opt' })

  " --- end elixir }}}
  " --- journal {{{

  call packager#add('junegunn/vim-journal', { 'type': 'opt' })
  call packager#add('atweiden/vim-finn', { 'branch': 'finn',
                                         \   'type': 'opt' })

  " --- end journal }}}
  " --- lisp {{{

  call packager#add('atweiden/vim-fennel', { 'type': 'opt' })
  call packager#add('janet-lang/janet.vim', { 'type': 'opt' })

  " repl
  call packager#add('Olical/conjure')

  " structured editing
  call packager#add('guns/vim-sexp')

  " --- end lisp }}}
  " --- raku {{{

  call packager#add('Raku/vim-raku', { 'type': 'opt' })

  " --- end raku }}}
  " --- toml {{{

  call packager#add('cespare/vim-toml', { 'type': 'opt' })

  " --- end toml }}}

  " end languages }}}

  " colors
  call packager#add('atweiden/seoul256.vim', { 'branch': 'fix-todo-hi' })

  " color utilities
  call packager#add('ntpeters/vim-better-whitespace')
  call packager#add('mhinz/vim-hugefile')
  call packager#add('nathanaelkane/vim-indent-guides', { 'type': 'opt' })
  call packager#add('junegunn/rainbow_parentheses.vim', { 'type': 'opt' })
  call packager#add('guns/xterm-color-table.vim', { 'type': 'opt' })
endfunction

command! PkgrSetup call PkgrSetup()
command! PkgrInstall call PkgrSetup() | call packager#install()
command! -bang PkgrUpdate call PkgrSetup() | call packager#update({ 'force_hooks': '<bang>' })
command! PkgrClean call PkgrSetup() | call packager#clean()
command! PkgrStatus call PkgrSetup() | call packager#status()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap: