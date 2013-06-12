function rvm -d 'Ruby enVironment Manager'
  set -l rvm_script ''

  if test -e /usr/local/rvm/scripts/rvm
    set rvm_script /usr/local/rvm/scripts/rvm
  end

  if test -e $HOME/.rvm/scripts/rvm
    set rvm_script $HOME/.rvm/scripts/rvm
  end

  set -l env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  bash -c 'source '$rvm_script'; rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv
  and eval (grep '^rvm\|^[^=]*PATH' $env_file | grep -v _clr | sed '/^[^=]*PATH/y/:/ /; s/^/set -xg /; s/=/ /; s/$/ ;/; s/(//; s/)//')

  rm -f $env_file
end
