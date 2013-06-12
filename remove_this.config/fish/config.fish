# in .config/fish/config.fish:
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch white

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate ' →'
set __fish_git_prompt_char_stashstate ' ↩'
set __fish_git_prompt_char_upstream_ahead ' ↑'
set __fish_git_prompt_char_upstream_behind ' ↓'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s > ' (__fish_git_prompt)

  set_color normal
end

rvm > /dev/null

set fish_greeting "Welcome Back Christopher! :)"

if status --is-interactive
  set -g -x PATH /usr/local/bin $PATH
  set -g -x PATH /usr/local/sbin $PATH
end

function fish_right_prompt -d "Write out the right prompt"
  set -l red (set_color -o red)
  set -l ruby $red(~/.rvm/bin/rvm-prompt)
  echo $ruby
end

set -x PGDATA $HOME/.pgdata

function pgstart
  pg_ctl -l $PGDATA/logfile start
end

function pgstop
  pg_ctl stop
end
