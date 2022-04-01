# Rockstar 🤘🎸

We all know you want to take it higher and rock on. This module gives you
a function and an `exec` provider to do just that! Write your code as hair
metal power ballads just like the gods of rock intended.

![the source of it all](https://github.com/binford2k/binford2k-rockstar/raw/main/tweet.png)

See the [Code with Rockstar](http://codewithrockstar.com) homepage for guidance
on writing Rockstar code.

### Setup Requirements

Any nodes running rockstar scripts will need the `kaiser-ruby` gem installed.
You'll also need `pry` because the author did too many lines of coke and forgot
to take debugging libraries out of the production release.

This is managed in the `rockstar` class, so you can just include that.

To clean up after, pass the `ensure => absent` parameter to that class and it
will remove the gems and the dependent libraries it pulls in. Note that just
because those were the dependencies resolved on my test machine doesn't mean
that they'll be accurate for yours, so you might want to observe which gems
get installed and remove them manually instead.

## Usage

Just write some rockstar code, then evaluate it with the `rockstar` function or
the `exec` provider. A `fizzbuzz.rock` example is included in the files directory,
used by the example manifest provided.

Function example:

```
include rockstar

notify { 'testing':
  message => rockstar(file('rockstar/fizzbuzz.rock')),
}
```

Exec examples:

```
include rockstar

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
```

## Limitations

Lol, you're not actually using this, are you?

