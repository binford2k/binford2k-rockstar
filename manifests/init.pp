# @summary Just installs the required dependencies
#
# Installs the interpreter, and also pry because the author accidentally left that in their code.
#
# @example
#   include rockstar
#
class rockstar (Enum['present', 'absent'] $ensure = 'present') {

  if $ensure == 'present' {
    package { ['kaiser-ruby', 'pry']:
      ensure   => present,
      provider => puppet_gem,
    }
  }
  else {
    # this isn't really safe because I don't know what users *might* have installed on their agents
    # but there's not a better way to automatically remove w/o bundler or some such
    package { ['kaiser-ruby', 'hashie', 'pry', 'method_source', 'coderay']:
      ensure   => absent,
      provider => puppet_gem,
    }
  }
}
