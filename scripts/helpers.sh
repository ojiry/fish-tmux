get_tmux_window_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-window-option -gv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}
