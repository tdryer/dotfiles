# wrapper script to use vim as kitty's scrollback pager while matching the
# current cursor position from the terminal

nvim \
    -c "norm G" \
    -c "call cursor($(expr $1 + $2), $3)" \
    -c "set nonumber nolist buftype=nofile" \
    -
