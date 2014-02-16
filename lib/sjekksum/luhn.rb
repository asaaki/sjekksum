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
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = convert_number_to_digits(number)
      sum    = digits.reverse.map.with_index do |digit, idx|
        idx.even? ? (digit * 2).divmod(10).reduce(&:+) : digit
      end.reduce(&:+)

      (10 - sum % 10) % 10
    end
    alias_method :checksum, :of

    #
    # Luhn validation of provided number
    #
    # @example
    #   Sjekksum::Luhn.valid?(79927398713) #=> true
    #
    # @param  number [Integer, String] number with included checksum
    #
    # @return [Boolean]
    def valid? number
      raise_on_type_mismatch number
      num, check = split_number(number)
      self.of(num) == check
    end
    alias_method :is_valid?, :valid?

    #
    # Transforms a number by appending the Luhn checksum digit
    #
    # @example
    #   Sjekksum::Luhn.convert(7992739871) #=> 79927398713
    #
    # @param  number [Integer, String] number without a checksum
    #
    # @return [Integer, String] final number including the checksum
    def convert number
      raise_on_type_mismatch number
      typed_conversion number
    end
    alias_method :transform, :convert

  end
end
