include rockstar

notify { 'testing':
  message => rockstar(file('rockstar/fizzbuzz.rock')),
}

exec { 'inline':
  command   => file('rockstar/fizzbuzz.rock'),
  provider  => rockstar,
  logoutput => true,
}

file { '/tmp/fizzbuzz.rock':
  ensure => file,
  owner  => 'root',
  mode   => '0666',
  source => 'puppet:///modules/rockstar/fizzbuzz.rock',
}
-> exec { 'from file':
  command   => '/tmp/fizzbuzz.rock',
  provider  => rockstar,
  logoutput => true,
}

