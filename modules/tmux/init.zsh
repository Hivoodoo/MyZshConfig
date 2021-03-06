#
# Defines tmux aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#   Georges Discry <georges@discry.be>
#   Xavier Cambar <xcambar@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[tmux] )); then
  return 1
fi

# use vi style
tmux setw -g mode-keys vi

#
# Auto Start
#

if ([[ "$TERM_PROGRAM" = 'iTerm.app' ]] && \
  zstyle -t ':prezto:module:tmux:iterm' integrate \
); then
  _tmux_iterm_integration='-CC'
fi

if ( [[ -n "$SSH_TTY" ]] && \
    zstyle -t ':prezto:module:tmux:auto-start' ssh-update \
); then
  tmux_update_ssh;
fi

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) || \
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) || \
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local-pre ) \
); then
  tmux start-server

  # Create a 'prezto' session if no session has been defined in tmux.conf.
  if ! tmux has-session 2> /dev/null; then
    tmux_session='El_Psy'
    tmux \
      new-session -d -s "$tmux_session" \; \
      set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  # Attach to the 'prezto' session or to the last session used.
  if ( \
    ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) || \
    ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
  ); then
    exec tmux $_tmux_iterm_integration attach-session
  fi
fi


#
# Aliases
#

# alias tmuxa="tmux $_tmux_iterm_integration new-session -A"
# alias tmuxl='tmux list-sessions'
