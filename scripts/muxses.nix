{ pkgs }: pkgs.writeShellScriptBin "muxses" ''
  TMUX=$(printenv TMUX || echo "") # had to do this for nix
  SESSIONS=$(${pkgs.tmux}/bin/tmux list-sessions | awk -F ":" '{print $1}' | ${pkgs.fzf}/bin/fzf --print-query | tail -1)

  if [[ "$TMUX" == "" ]]; then
    ${pkgs.tmux}/bin/tmux new -As"$SESSIONS"
  else
    SEARCH=$(${pkgs.tmux}/bin/tmux list-sessions | grep "$SESSIONS")
  
    if [[ "$SEARCH" != "" ]]; then
      ${pkgs.tmux}/bin/tmux switch-client -t"$SESSIONS"
    else
      ${pkgs.tmux}/bin/tmux new -d -s"$SESSIONS"
      ${pkgs.tmux}/bin/tmux switch-client -t"$SESSIONS"
    fi
  fi
''
