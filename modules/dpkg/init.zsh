#
# Defines dpkg aliases.
#
# Authors:
#   Daniel Bolton <dbb@9y.com>
#   Benjamin Boudreau <boudreau.benjamin@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[dpkg] && ! $+commands[apt] )); then
  return 1
fi

#
# Aliases
#

# Cleans the cache.
# alias debc='sudo apt-get clean && sudo apt-get autoclean'

# Displays a file's package.
# alias debf='apt-file search --regexp'

# Installs packages from repositories.
alias agi='sudo apt install'

# Installs packages from files.
# alias debI='sudo dpkg -i'

# Displays package information.
alias agv='apt show'

# Updates the package lists.
alias agu='sudo apt update'

# Upgrades outdated packages.
alias agU='sudo apt dist-upgrade'

# Removes packages.
alias agx='sudo apt remove'
alias agX='sudo apt purge'

# Removes packages, their configuration, and unneeded dependencies.
# alias debX='sudo apt-get remove --purge && sudo apt-get autoremove --purge'

# Searches for packages.
if (( $+commands[aptitude] )); then
  alias debs='aptitude -F "* %p -> %d \n(%v/%V)" --no-gui --disable-columns search'
else
  alias debs='apt search'
fi

alias ags='apt search'


# Creates a basic deb package.
alias deb-build='time dpkg-buildpackage -rfakeroot -us -uc'

# Removes all kernel images and headers, except for the ones in use.

# alias deb-kclean='sudo aptitude remove -P "?and(~i~nlinux-(ima|hea) ?not(~n`uname -r`))"'
