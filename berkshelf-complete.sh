#!/bin/bash
#
# Description
#   Add tab completion for berkshelf
#
# Configuration:
#   BERKSHELF_BERKSFILE (default is 'Berksfile')
#
# Notes:
#   Must be added to your ~/.bashrc, ~/.zshrc, etc
#
# Author:
#   Seth Vargo <sethvargo@gmail.com>
#
# License:
#   Apache 2.0
#

_bundler() {
  which bundle > /dev/null 2>&1 && [ -f "$(pwd)/Gemfile" ]
}

# Overwrite berks to use bundler if defined
_berks() {
  [ _bundler ] && bundle exec berks $@ || berks $@
}

_berkshelf_commands() {
  local cachefile=~/.berkshelf/.commands
  [ ! -f $cachefile ] && $(_berks help | grep berks | cut -d " " -f 4 > $cachefile)
  cat $cachefile
}

_berkshelf_cookbooks() {
  local file=${BERKSHELF_BERKSFILE:-Berksfile}
  local lock_file="${file}.lock"
  if [ -e $lock_file ]; then
    # trying to detect cookbook names from lock file using format '<cookbook_name> (x.y.z)'
    grep -o -e '[^ ]\+ ([0-9]\+\.[0-9]\+\.[0-9]\+)' $lock_file | sed 's/\([^ ]\+\) .*$/\1/'
  fi
}

_local_cookbooks() {
  [ -d cookbooks ] && ls -d cookbooks/*/ | cut -d "/" -f 2
}

_berkshelf() {
  # local curr action commands
  COMPREPLY=()
  curr="${COMP_WORDS[COMP_CWORD]}"
  action="${COMP_WORDS[1]}"

  case "${action}" in
    "info"|"open"|"outdated"|"show"|"update"|"upload"|"contingent")
      local berkshelf_cookbooks=`_berkshelf_cookbooks`
      local local_cookbooks=`_local_cookbooks`
      local cookbooks=`echo $berkshelf_cookbooks $local_cookbooks | sort -n | uniq`
      COMPREPLY=($(compgen -W "${cookbooks}" -- ${curr}))
      return 0
      ;;
    *)
      [ "$COMP_CWORD" -gt "1" ] && return 0
      ;;
  esac

  # List of commands to complete
  commands=`_berkshelf_commands`

  COMPREPLY=($(compgen -W "${commands}" -- ${curr}))
  return 0
}

complete -F _berkshelf berks
