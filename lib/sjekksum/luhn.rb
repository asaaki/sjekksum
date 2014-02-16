module Sjekksum
  #
  # Module for calculation and validation of Luhn checksums
  #
  # @see http://en.wikipedia.org/wiki/Luhn_algorithm Luhn algorithm
  #
  module Luhn
    extend self
    extend Shared

    #
    # Calculates Luhn checksum
    #
    # @example
    #   Sjekksum::Luhn.of(7992739871) #=> 3
    #
    # @param  number [Integer] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = number.to_s.chars.map(&:to_i)
      sum    = digits.reverse.map.with_index do |digit, idx|
        idx.even? ? (digit * 2).divmod(10).reduce(&:+) : digit
      end.reverse.reduce(&:+)

      (10 - sum % 10) % 10
    end
    alias_method :checksum, :of

    #
    # Luhn validation of provided number
    #
    # @example
    #   Sjekksum::Luhn.valid?(79927398713) #=> true
    #
    # @param  number [Integer] number with included checksum
    #
    # @return [Boolean]
    def valid? number
      raise_on_type_mismatch number
      self.of(number.div(10)) == (number % 10)
    end
    alias_method :is_valid?, :valid?

    #
    # Transforms a number by appending the Luhn checksum digit
    #
    # @example
    #   Sjekksum::Luhn.convert(7992739871) #=> 79927398713
    #
    # @param  number [Integer] number without a checksum
    #
    # @return [Integer] final number including the checksum
    def convert number
      raise_on_type_mismatch number
      (number * 10) + self.of(number)
    end
    alias_method :transform, :convert

  end
end
