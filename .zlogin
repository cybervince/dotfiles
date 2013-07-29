if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi
