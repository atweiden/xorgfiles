[[ -r "$HOME/.bashrc" ]] \
  && source "$HOME/.bashrc"

# implement XDG_RUNTIME_DIR sans systemd
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  readonly XDG_RUNTIME_DIR="/tmp/xdg-runtime-dir-$UID"
  if ! [[ -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir --mode=0700 "$XDG_RUNTIME_DIR"
  fi
fi
if ! [[ -d "$XDG_RUNTIME_DIR" \
     && -O "$XDG_RUNTIME_DIR" \
     && "$(stat --format='%a' "$XDG_RUNTIME_DIR")" == '700' ]]; then
  echo "[\$XDG_RUNTIME_DIR] Sorry, encountered permissions problem with $XDG_RUNTIME_DIR." >&2
  echo -n "[\$XDG_RUNTIME_DIR] " >&2
  ls -l --directory "$XDG_RUNTIME_DIR" >&2
  unset XDG_RUNTIME_DIR
  readonly XDG_RUNTIME_DIR="$(mktemp --directory "/tmp/xdg-runtime-dir-$UID-XXXXXX")"
  echo "[\$XDG_RUNTIME_DIR] set \$XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" >&2
fi
export XDG_RUNTIME_DIR

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
