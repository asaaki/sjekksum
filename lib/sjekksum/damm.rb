module Sjekksum
  #
  # Module for calculation and validation of Damm checksums
  #
  # @see http://en.wikipedia.org/wiki/Damm_algorithm Damm algorithm
  #
  module Damm
    extend self
    extend Shared

    # The totally anti-symmetric quasigroup
    # @see http://archiv.ub.uni-marburg.de/diss/z2004/0516/pdf/dhmd.pdf [PDF] Damm, H. Michael (2004). Total anti-symmetrische Quasigruppen (Dr. rer. nat.). Philipps-Universität Marburg.
    QUASIGROUP = [
      [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
      [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
      [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
      [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
      [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
      [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
      [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
      [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
      [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
      [2, 5, 8, 1, 4, 3, 6, 7, 9, 0]
    ].freeze

    #
    # Calculates Damm checksum
    #
    # @example
    #   Sjekksum::Damm.of(572) #=> 4
    #
    # @param  number [Integer] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = number.to_s.chars.map(&:to_i)
      digits.reduce(0){|check, digit| QUASIGROUP[check][digit] }
    end
    alias_method :checksum, :of

    #
    # Damm validation of provided number
    #
    # @example
    #   Sjekksum::Damm.valid?(5724) #=> true
    #
    # @param  number [Integer] number with included checksum
    #
    # @return [Boolean]
    def valid? number
      raise_on_type_mismatch number
      self.of(number).zero?
    end
    alias_method :is_valid?, :valid?

    #
    # Transforms a number by appending the Damm checksum digit
    #
    # @example
    #   Sjekksum::Damm.convert(572) #=> 5724
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
