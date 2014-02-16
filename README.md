# Sjekksum [![Gem Version](https://badge.fury.io/rb/sjekksum.png)](http://badge.fury.io/rb/sjekksum) [![Build Status](https://travis-ci.org/asaaki/sjekksum.png?branch=master)](https://travis-ci.org/asaaki/sjekksum)

A gem to provide some checksum algorithms like Luhn, Damm and Verhoeff.

----

All used algorithms for generating and validating checksums must calculate a single check digit only.

More extensive checksum algorithms like Adler-32, CRC, BSD checksum, SYSV checksum, all hash algorithms and friends are not part of this project.
Also no advanced algorithms like IBAN and credit card number calculation can be found here due to their nature in these cases more transformations and steps have to be taken.
Furthermore this gem does not allow any other input type than integers to simplify transformations here (so all extended algorithms allowing characters are not included as well).

Shortly: This gem tries to follow the [UNIX philosophy](http://en.wikipedia.org/wiki/Unix_philosophy) in parts: »Write programs that do one thing and do it well.«



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

Sjekksum.damm(572)            #=> 4
Sjekksum.damm!(572)           #=> 5724
Sjekksum.damm?(5724)          #=> true

Sjekksum.luhn(7992739871)     #=> 3
Sjekksum.luhn!(7992739871)    #=> 79927398713
Sjekksum.luhn?(79927398713)   #=> true

Sjekksum.verhoeff(142857)     #=> 0
Sjekksum.verhoeff?(1428570)   #=> true
Sjekksum.verhoeff!(142857)    #=> 1428570

Sjekksum.primitive(232323)    #=> 6
Sjekksum.primitive?(2323236)  #=> true
Sjekksum.primitive!(232323)   #=> 2323236

Sjekksum.primitive97(23569)   #=> 0
Sjekksum.primitive97?(235695) #=> true
Sjekksum.primitive97!(23569)  #=> 235695
```



## License

[MIT/X11](./LICENSE)

Copyright (c) 2013—2014 Christoph Grabo
