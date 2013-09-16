echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# chruby source and auto-select ruby by .ruby-version file below
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# set current version of ruby
# chruby 1.9.3-p448
# echo "Ruby Version 1.9.3-p448 loaded via chruby"
# RVM below (i suggest chruby over RVM because it is slimmer and installs dependencies)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin

# git completion (commented out in case you don't have these)
# source ~/.git-completion.bash
# source ~/.git-prompt.sh
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
### Set up overhead for git branch
c_reset='\[\e[0m\]'
c_path='\[\e[0;31m\]'
c_git_clean='\[\e[0;32m\]'
c_git_dirty='\[\e[0;31m\]'

PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '
echo "Welcome Back User :)"

git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# DBC SF cleanup scripts
# comment that out if you aren't using it
source .sfcleanup

# Add postgres to autostart with this line from console
# ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

function pgstart {
  pg_ctl -D /usr/local/var/postgres -l logfile start
}

function pgstop {
  pg_ctl -D /usr/local/var/postgres stop
}
