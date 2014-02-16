module Sjekksum
  #
  # Module for calculation and validation of Primitive checksums
  #
  # The primitive checksum is just a reduced digit sum (modulo 9).
  #
  module Primitive
    extend self
    extend Shared

    #
    # Calculates Primitive checksum
    #
    # @example
    #   Sjekksum::Primitive.of(232323) #=> 6
    #
    # @param  number [Integer] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      number % 9
    end
    alias_method :checksum, :of

    #
    # Primitive validation of provided number
    #
    # @example
    #   Sjekksum::Primitive.valid?(232323) #=> true
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
    # Transforms a number by appending the Primitive checksum digit
    #
    # @example
    #   Sjekksum::Primitive.convert(232323) #=> 2323236
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
