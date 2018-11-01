#!/bin/bash
# Credit: https://vi.stackexchange.com/a/11733

# Make directory in ~/.vim/pack and cd into it.
#
# Arguments:
#   _package_group, a string directory name.
#   _package_order, start or opt.
#
# Examples:
#   set_dir syntax-highlighting start
#
set_dir() {
  local _package_group
  local _package_order
  local _path

  _package_group="$1"
  _package_order="$2"
  _path="$HOME/.vim/pack/$_package_group/$_package_order"

  mkdir -p "$_path"
  cd "$_path" || exit
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   _repo_url, a URL to the git repo without https://github.com/ prefixed.
#
# Examples:
#   package tpope/vim-endwise
#
package() {
  local _expected_repo
  local _github_url
  local _repo_url
  local _result

  _github_url='https://github.com'

  _repo_url="$1"
  _expected_repo="$(basename "$_repo_url")"

  if [[ -d "$_expected_repo" ]]; then
    cd "$_expected_repo" || exit
    _result="$(git pull)"
    echo "$_expected_repo: $_result"
  else
    echo "$_expected_repo: Cloning..."
    git clone "${_github_url}/${_repo_url}"
  fi
}

(set_dir 'color-utils' 'start'
 package 'mhinz/vim-hugefile' &
 wait) &
(set_dir 'colors' 'opt'
 package 'junegunn/seoul256.vim' &
 wait) &
(set_dir 'command-runners' 'opt'
 package 'tpope/vim-tbone' &
 wait) &
(set_dir 'comments' 'start'
 package 'tpope/vim-commentary' &
 wait) &
(set_dir 'crypto' 'start'
 package 'jamessan/vim-gnupg' &
 wait) &
(set_dir 'folds' 'start'
 package 'Konfekt/FastFold' &
 package 'Harenome/vim-neatfoldtext' &
 wait) &
(set_dir 'keyboard' 'opt'
 package 'kana/vim-arpeggio' &
 wait) &
(set_dir 'modelines' 'start'
 package 'ciaranm/securemodelines' &
 wait) &
(set_dir 'movement' 'start'
 package 'rhysd/clever-f.vim' &
 package 'christoomey/vim-tmux-navigator' &
 wait) &
(set_dir 'repeat' 'start'
 package 'tpope/vim-repeat' &
 wait) &
(set_dir 'search-replace' 'start'
 package 'junegunn/fzf' &
 package 'junegunn/fzf.vim' &
 wait) &
(set_dir 'surround' 'start'
 package 'tpope/vim-surround' &
 wait) &
(set_dir 'syntax' 'start'
 package 'elixir-editors/vim-elixir' &
 package 'junegunn/vim-journal' &
 package 'atweiden/vim-finn' &
 package 'vim-perl/vim-perl' &
 package 'vim-perl/vim-perl6' &
 package 'cespare/vim-toml' &
 wait) &
(set_dir 'textobj' 'start'
 package 'wellle/targets.vim' &
 package 'kana/vim-textobj-entire' &
 package 'kana/vim-textobj-user' &
 wait) &
(set_dir 'vcs' 'start'
 package 'rhysd/committia.vim' &
 wait) &
(set_dir 'windows' 'start'
 package 'talek/obvious-resize' &
 wait) &
wait

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
