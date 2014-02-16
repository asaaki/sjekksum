# Sjekksum [![Gem Version](https://badge.fury.io/rb/sjekksum.png)](http://badge.fury.io/rb/sjekksum) [![Build Status](https://travis-ci.org/asaaki/sjekksum.png?branch=master)](https://travis-ci.org/asaaki/sjekksum)

A gem to provide some checksum algorithms like Damm, Luhn, UPC and Verhoeff.

----

All used algorithms for generating and validating checksums **must calculate a single check digit only.**

More extensive checksum algorithms like Adler-32, CRC, BSD checksum, SYSV checksum, all hash algorithms and friends are not part of this project.

Furthermore this gem does not allow any other input type than integers or strings of integer digits to simplify transformations here (so all extended algorithms allowing characters are not included as well).

For the string inputs all non-integer bytes are thrown away:

```ruby
"01-234.567 89"
#=>
"0123456789" # cleaned string
#=>
[0,1,2,3,4,5,6,7,8,9] # internal digits representation
```

Shortly: This gem tries to follow the [UNIX philosophy](http://en.wikipedia.org/wiki/Unix_philosophy) in parts: _»Write programs that do one thing and do it well.«_



## Installation

Add this line to your application's Gemfile:

```ruby
gem "sjekksum"
```

And then execute:

```shell
bundle
```

Or install it yourself as:

```shell
gem install sjekksum
```


## Usage

```ruby
require "sjekksum"

Sjekksum.damm(572)              #=> 4
Sjekksum.damm!(572)             #=> 5724
Sjekksum.damm?(5724)            #=> true

Sjekksum.luhn(7992739871)       #=> 3
Sjekksum.luhn!(7992739871)      #=> 79927398713
Sjekksum.luhn?(79927398713)     #=> true

Sjekksum.upc("03600024145")     #=> 7
Sjekksum.upc!("03600024145")    #=> "036000241457"
Sjekksum.upc?("036000241457")   #=> true

Sjekksum.verhoeff(142857)       #=> 0
Sjekksum.verhoeff!(142857)      #=> 1428570
Sjekksum.verhoeff?(1428570)     #=> true

Sjekksum.primitive(232323)      #=> 6
Sjekksum.primitive!(232323)     #=> 2323236
Sjekksum.primitive?(2323236)    #=> true

Sjekksum.primitive97(23569)     #=> 5
Sjekksum.primitive97!(23569)    #=> 235695
Sjekksum.primitive97?(235695)   #=> true
```



## License

[MIT/X11](./LICENSE)

Copyright (c) 2013—2014 Christoph Grabo
