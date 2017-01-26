#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

git_repo_name_interpolation=(
  "\#{repository_name}"
)

git_repo_name_commands=(
  "#($CURRENT_DIR/scripts/repository_name.sh)"
)

set_tmux_window_option() {
	local option="$1"
	local value="$2"
	tmux set-window-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#git_repo_name_commands[@]}; i++)); do
		all_interpolated=${all_interpolated/${git_repo_name_interpolation[$i]}/${git_repo_name_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_window_option() {
	local option="$1"
	local option_value="$(get_tmux_window_option"$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_window_option "$option" "$new_option_value"
}

main() {
  update_tmux_window_option "window-status-format"
  update_tmux_window_option "window-status-current-format"
}
main
