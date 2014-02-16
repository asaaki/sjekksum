require "sjekksum/version"
require "sjekksum/shared"
require "sjekksum/damm"
require "sjekksum/isbn10"
require "sjekksum/isbn13"
require "sjekksum/luhn"
require "sjekksum/upc"
require "sjekksum/verhoeff"
require "sjekksum/primitive"
require "sjekksum/primitive97"

#
# Base module with convenient shortcuts
#
module Sjekksum
  extend self

  #
  # Calculates Damm checksum
  #
  # @example
  #   Sjekksum.damm(572) #=> 4
  #
  # @see Sjekksum::Damm#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def damm_of number
    Damm.of number
  end
  alias_method :damm, :damm_of

  #
  # Calculates ISBN-10 checksum
  #
  # @example
  #   Sjekksum.isbn10("147743025") #=> 3
  #   Sjekksum.isbn10("193435600") #=> "X"
  #
  # @see Sjekksum::ISBN10#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer, String] calculated checksum
  def isbn10_of number
    ISBN10.of number
  end
  alias_method :isbn10, :isbn10_of

  #
  # Calculates ISBN-13 checksum
  #
  # @example
  #   Sjekksum.isbn13("978-0-306-40615-") #=> 7
  #
  # @see Sjekksum::ISBN13#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer, String] calculated checksum
  def isbn13_of number
    ISBN13.of number
  end
  alias_method :isbn13, :isbn13_of

  #
  # Calculates Luhn checksum
  #
  # @example
  #   Sjekksum.luhn(7992739871) #=> 3
  #
  # @see Sjekksum::Luhn#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def luhn_of number
    Luhn.of number
  end
  alias_method :luhn, :luhn_of

  #
  # Calculates UPC checksum
  #
  # @example
  #   Sjekksum.upc("03600024145") #=> 7
  #
  # @see Sjekksum::UPC#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def upc_of number
    UPC.of number
  end
  alias_method :upc, :upc_of

  #
  # Calculates Verhoeff checksum
  #
  # @example
  #   Sjekksum.verhoeff(142857) #=> 0
  #
  # @see Sjekksum::Verhoeff#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def verhoeff_of number
    Verhoeff.of number
  end
  alias_method :verhoeff, :verhoeff_of

  #
  # Calculates Primitive checksum
  #
  # @example
  #   Sjekksum.primitive(232323) #=> 6
  #
  # @see Sjekksum::Primitive#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def primitive_of number
    Primitive.of number
  end
  alias_method :primitive, :primitive_of

  #
  # Calculates Primitive97 checksum
  #
  # @example
  #   Sjekksum.primitive97(232323) #=> 6
  #
  # @see Sjekksum::Primitive97#of
  #
  # @param  number [Integer, String] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def primitive97_of number
    Primitive97.of number
  end
  alias_method :primitive97, :primitive97_of

  #
  # Damm validation of provided number
  #
  # @example
  #   Sjekksum.damm?(5724) #=> true
  #
  # @see Sjekksum::Damm#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_damm? number
    Damm.valid? number
  end
  alias_method :damm?, :valid_damm?

  #
  # ISBN-10 validation of provided number
  #
  # @example
  #   Sjekksum.isbn10?("1477430253") #=> true
  #   Sjekksum.isbn10?("193435600X") #=> true
  #
  # @see Sjekksum::ISBN10#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_isbn10? number
    ISBN10.valid? number
  end
  alias_method :isbn10?, :valid_isbn10?

  #
  # ISBN-13 validation of provided number
  #
  # @example
  #   Sjekksum.isbn13?("978-0-306-40615-7") #=> true
  #
  # @see Sjekksum::ISBN13#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_isbn13? number
    ISBN13.valid? number
  end
  alias_method :isbn13?, :valid_isbn13?

  #
  # Luhn validation of provided number
  #
  # @example
  #   Sjekksum.luhn?(79927398713) #=> true
  #
  # @see Sjekksum::Luhn#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_luhn? number
    Luhn.valid? number
  end
  alias_method :luhn?, :valid_luhn?

  #
  # UPC validation of provided number
  #
  # @example
  #   Sjekksum.upc?("036000241457") #=> true
  #
  # @see Sjekksum::UPC#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_upc? number
    UPC.valid? number
  end
  alias_method :upc?, :valid_upc?

  #
  # Verhoeff validation of provided number
  #
  # @example
  #   Sjekksum.verhoeff?(1428570) #=> true
  #
  # @see Sjekksum::Verhoeff#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_verhoeff? number
    Verhoeff.valid? number
  end
  alias_method :verhoeff?, :valid_verhoeff?

  #
  # Primitive validation of provided number
  #
  # @example
  #   Sjekksum.primitive?(2323236) #=> true
  #
  # @see Sjekksum::Primitive#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_primitive? number
    Primitive.valid? number
  end
  alias_method :primitive?, :valid_primitive?

  #
  # Primitive97 validation of provided number
  #
  # @example
  #   Sjekksum.primitive97?(2323235) #=> true
  #
  # @see Sjekksum::Primitive97#valid?
  #
  # @param  number [Integer, String] number with included checksum
  #
  # @return [Boolean]
  def valid_primitive97? number
    Primitive97.valid? number
  end
  alias_method :primitive97?, :valid_primitive97?

  #
  # Transforms a number by appending the Damm checksum digit
  #
  # @example
  #   Sjekksum.damm!(572) #=> 5724
  #
  # @see Sjekksum::Damm#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_damm number
    Damm.convert number
  end
  alias_method :damm!, :make_damm

  #
  # Transforms a number by appending the ISBN-10 checksum digit
  #
  # @example
  #   Sjekksum.isbn10!("147743025") #=> "1477430253"
  #   Sjekksum.isbn10!("193435600") #=> "193435600X"
  #
  # @see Sjekksum::ISBN10#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_isbn10 number
    ISBN10.convert number
  end
  alias_method :isbn10!, :make_isbn10

  #
  # Transforms a number by appending the ISBN-13 checksum digit
  #
  # @example
  #   Sjekksum.isbn13("978-0-306-40615-") #=> "978-0-306-40615-7"
  #
  # @see Sjekksum::ISBN13#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_isbn13 number
    ISBN13.convert number
  end
  alias_method :isbn13!, :make_isbn13

  #
  # Transforms a number by appending the Luhn checksum digit
  #
  # @example
  #   Sjekksum.luhn!(7992739871) #=> 79927398713
  #
  # @see Sjekksum::Luhn#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_luhn number
    Luhn.convert number
  end
  alias_method :luhn!, :make_luhn

  #
  # Transforms a number by appending the UPC checksum digit
  #
  # @example
  #   Sjekksum.upc!("03600024145") #=> "03600024147"
  #
  # @see Sjekksum::UPC#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_upc number
    UPC.convert number
  end
  alias_method :upc!, :make_upc

  #
  # Transforms a number by appending the Verhoeff checksum digit
  #
  # @example
  #   Sjekksum.verhoeff!(142857) #=> 1428570
  #
  # @see Sjekksum::Verhoeff#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_verhoeff number
    Verhoeff.convert number
  end
  alias_method :verhoeff!, :make_verhoeff

  #
  # Transforms a number by appending the Primitive checksum digit
  #
  # @example
  #   Sjekksum.primitive!(232323) #=> 2323236
  #
  # @see Sjekksum::Primitive#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_primitive number
    Primitive.convert number
  end
  alias_method :primitive!, :make_primitive

  #
  # Transforms a number by appending the Primitive97 checksum digit
  #
  # @example
  #   Sjekksum.primitive97!(232323) #=> 2323235
  #
  # @see Sjekksum::Primitive97#convert
  #
  # @param  number [Integer, String] number without a checksum
  #
  # @return [Integer, String] final number including the checksum
  def make_primitive97 number
    Primitive97.convert number
  end
  alias_method :primitive97!, :make_primitive97

end
