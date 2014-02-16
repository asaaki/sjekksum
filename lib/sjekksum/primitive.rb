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
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      convert_to_int(number) % 9
    end
    alias_method :checksum, :of

    #
    # Primitive validation of provided number
    #
    # @example
    #   Sjekksum::Primitive.valid?(232323) #=> true
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
    # Transforms a number by appending the Primitive checksum digit
    #
    # @example
    #   Sjekksum::Primitive.convert(232323) #=> 2323236
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
