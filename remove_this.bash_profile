[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# source ~/.git-completion.bash
# source ~/.git-prompt.sh
PATH=$PATH:$HOME/.rvm/bin
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
### Set up overhead for git branch
c_reset='\[\e[0m\]'
c_path='\[\e[0;31m\]'
c_git_clean='\[\e[0;32m\]'
c_git_dirty='\[\e[0;31m\]'

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


 # Add RVM to PATH for scripting
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'
# export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '
echo "Welcome Back Friend :)"
