# Sjekksum [![Gem Version](https://badge.fury.io/rb/sjekksum.png)](http://badge.fury.io/rb/sjekksum) [![Build Status](https://travis-ci.org/asaaki/sjekksum.png?branch=master)](https://travis-ci.org/asaaki/sjekksum)

A gem to provide some checksum algorithms like Luhn, Damm and Verhoeff.



## Installation

Add this line to your application's Gemfile:

    gem "sjekksum"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install damm



## Usage

```ruby
require "sjekksum"

Sjekksum.damm(572) #=> 4
Sjekksum.damm!(572) #=> 5724
Sjekksum.damm?(5724) #=> true

Sjekksum.luhn(7992739871) #=> 3
Sjekksum.luhn!(7992739871) #=> 79927398713
Sjekksum.luhn?(79927398713) #=> true

Sjekksum.verhoeff(142857) #=> 0
Sjekksum.verhoeff?(1428570) #=> true
Sjekksum.verhoeff!(142857) #=> 1428570
```



## License

[MIT/X11](./LICENSE)

Copyright (c) 2013—2014 Christoph Grabo
