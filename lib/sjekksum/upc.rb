module Sjekksum
  #
  # Module for calculation and validation of UPC (Universal Product Code) checksums
  #
  # @see http://en.wikipedia.org/wiki/Universal_Product_Code#Check_digits Universal Product Code
  #
  # It's like Luhn but multiplies by 3 instead of 2.
  # Also it must allow validation of numbers with leading zeros.
  #
  module UPC
    extend self
    extend Shared

    #
    # Calculates UPC checksum
    #
    # @example
    #   Sjekksum::UPC.of("03600024145") #=> 7
    #
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = convert_number_to_digits(number)

      sum    = digits.map.with_index do |digit, idx|
        idx.even? ? (digit * 3) : digit
      end.reduce(&:+)

      (10 - sum % 10) % 10
    end
    alias_method :checksum, :of

    #
    # UPC validation of provided number
    #
    # @example
    #   Sjekksum::UPC.valid?("036000241457") #=> true
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
    # Transforms a number by appending the UPC checksum digit
    #
    # It will preserve type (Integer/String) and therefore leading zeros.
    #
    # @example
    #   Sjekksum::UPC.convert("03600024145") #=> "036000241457"
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
