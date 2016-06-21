#
# Defines yum aliases.
#
# Authors:
#   Simon <contact@saimon.org>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[yum] )); then
  return 1
fi

#
# Aliases
#

# alias yumc='sudo yum clean all'    # Cleans the cache.
# alias yumh='yum history'           # Displays history.
alias agi='sudo yum install'      # Installs package(s).
alias agl='yum list'              # Lists packages.
alias agL='yum list installed'    # Lists installed packages.
alias agv='yum info'              # Displays package information.
alias agx='sudo yum remove'       # Removes package(s).
alias ags='yum search'            # Searches for a package.
alias agu='sudo yum update'       # Updates packages.
alias agU='sudo yum upgrade'      # Upgrades packages.
