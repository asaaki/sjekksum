require "sjekksum/version"
require "sjekksum/shared"
require "sjekksum/damm"
require "sjekksum/luhn"
require "sjekksum/verhoeff"

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
  # @param  number [Integer] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def damm_of number
    Damm.of number
  end
  alias_method :damm, :damm_of

  #
  # Calculates Luhn checksum
  #
  # @example
  #   Sjekksum.luhn(7992739871) #=> 3
  #
  # @see Sjekksum::Luhn#of
  #
  # @param  number [Integer] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def luhn_of number
    Luhn.of number
  end
  alias_method :luhn, :luhn_of

  #
  # Calculates Verhoeff checksum
  #
  # @example
  #   Sjekksum.verhoeff(142857) #=> 0
  #
  # @see Sjekksum::Verhoeff#of
  #
  # @param  number [Integer] number for which the checksum should be calculated
  #
  # @return [Integer] calculated checksum
  def verhoeff_of number
    Verhoeff.of number
  end
  alias_method :verhoeff, :verhoeff_of

  #
  # Damm validation of provided number
  #
  # @example
  #   Sjekksum.damm?(5724) #=> true
  #
  # @see Sjekksum::Damm#valid?
  #
  # @param  number [Integer] number with included checksum
  #
  # @return [Boolean]
  def valid_damm? number
    Damm.valid? number
  end
  alias_method :damm?, :valid_damm?

  #
  # Luhn validation of provided number
  #
  # @example
  #   Sjekksum.luhn?(79927398713) #=> true
  #
  # @see Sjekksum::Luhn#valid?
  #
  # @param  number [Integer] number with included checksum
  #
  # @return [Boolean]
  def valid_luhn? number
    Luhn.valid? number
  end
  alias_method :luhn?, :valid_luhn?

  #
  # Verhoeff validation of provided number
  #
  # @example
  #   Sjekksum.verhoeff?(1428570) #=> true
  #
  # @see Sjekksum::Verhoeff#valid?
  #
  # @param  number [Integer] number with included checksum
  #
  # @return [Boolean]
  def valid_verhoeff? number
    Verhoeff.valid? number
  end
  alias_method :verhoeff?, :valid_verhoeff?

  #
  # Transforms a number by appending the Damm checksum digit
  #
  # @example
  #   Sjekksum.damm!(572) #=> 5724
  #
  # @see Sjekksum::Damm#convert
  #
  # @param  number [Integer] number without a checksum
  #
  # @return [Integer] final number including the checksum
  def make_damm number
    Damm.convert number
  end
  alias_method :damm!, :make_damm

  #
  # Transforms a number by appending the Luhn checksum digit
  #
  # @example
  #   Sjekksum.luhn!(7992739871) #=> 79927398713
  #
  # @see Sjekksum::Luhn#convert
  #
  # @param  number [Integer] number without a checksum
  #
  # @return [Integer] final number including the checksum
  def make_luhn number
    Luhn.convert number
  end
  alias_method :luhn!, :make_luhn

  #
  # Transforms a number by appending the Verhoeff checksum digit
  #
  # @example
  #   Sjekksum.verhoeff!(142857) #=> 1428570
  #
  # @see Sjekksum::Verhoeff#convert
  #
  # @param  number [Integer] number without a checksum
  #
  # @return [Integer] final number including the checksum
  def make_verhoeff number
    Verhoeff.convert number
  end
  alias_method :verhoeff!, :make_verhoeff

end
