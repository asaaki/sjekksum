module Sjekksum
  #
  # Module for calculation and validation of Verhoeff checksums
  #
  # @see http://en.wikipedia.org/wiki/Verhoeff_algorithm Verhoeff algorithm
  #
  module Verhoeff
    extend self
    extend Shared

    # Table of multiplication in the dihedral group D5
    DIHEDRAL_GROUP_D5 = [
      [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
      [ 1, 2, 3, 4, 0, 6, 7, 8, 9, 5 ],
      [ 2, 3, 4, 0, 1, 7, 8, 9, 5, 6 ],
      [ 3, 4, 0, 1, 2, 8, 9, 5, 6, 7 ],
      [ 4, 0, 1, 2, 3, 9, 5, 6, 7, 8 ],
      [ 5, 9, 8, 7, 6, 0, 4, 3, 2, 1 ],
      [ 6, 5, 9, 8, 7, 1, 0, 4, 3, 2 ],
      [ 7, 6, 5, 9, 8, 2, 1, 0, 4, 3 ],
      [ 8, 7, 6, 5, 9, 3, 2, 1, 0, 4 ],
      [ 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ]
    ].freeze

    # The permutation table
    PERMUTATION = [
      [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
      [ 1, 5, 7, 6, 2, 8, 3, 0, 9, 4 ],
      [ 5, 8, 0, 3, 7, 9, 6, 1, 4, 2 ],
      [ 8, 9, 1, 6, 0, 4, 3, 5, 2, 7 ],
      [ 9, 4, 5, 3, 1, 2, 6, 8, 7, 0 ],
      [ 4, 2, 8, 6, 5, 7, 3, 9, 0, 1 ],
      [ 2, 7, 9, 3, 8, 0, 6, 4, 1, 5 ],
      [ 7, 0, 4, 6, 9, 1, 3, 2, 5, 8 ]
    ].freeze

    # The multiplicative inverse of a digit in the dihedral group D5
    INVERSE = [ 0, 4, 3, 2, 1, 5, 6, 7, 8, 9 ].freeze

    #
    # Calculates Verhoeff checksum
    #
    # @example
    #   Sjekksum::Verhoeff.of(142857) #=> 0
    #
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = convert_number_to_digits(number)
      INVERSE[digits.reverse_each.with_index.reduce(0) { |check, (digit, idx)|
        d_row = DIHEDRAL_GROUP_D5[check]
        d_row[ PERMUTATION[idx.next % 8][digit] ]
      }]
    end
    alias_method :checksum, :of

    #
    # Verhoeff validation of provided number
    #
    # @example
    #   Sjekksum::Verhoeff.valid?(1428570) #=> true
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
    # Transforms a number by appending the Verhoeff checksum digit
    #
    # @example
    #   Sjekksum::Verhoeff.convert(142857) #=> 1428570
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
