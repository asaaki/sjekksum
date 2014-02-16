module Sjekksum
  #
  # Module for calculation and validation of ISBN-10 (International Standard Book Number) checksums
  #
  # @see http://en.wikipedia.org/wiki/International_Standard_Book_Number#ISBN-13_check_digit_calculation ISBN-13 check digit calculation
  #
  # Its check digit is generated the same way as the {Sjekksum::UPC} except that the even digits are multiplied by 3 instead of the odd digits.
  #
  module ISBN13
    extend self
    extend Shared

    #
    # Calculates ISBN13 checksum
    #
    # @example
    #   Sjekksum::ISBN13.of("978-0-306-40615-") #=> 7
    #
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = convert_number_to_digits(number)

      sum    = digits.map.with_index do |digit, idx|
        idx.odd? ? (digit * 3) : digit
      end.reduce(&:+)

      (10 - sum % 10) % 10
    end
    alias_method :checksum, :of

    #
    # ISBN13 validation of provided number
    #
    # @example
    #   Sjekksum::ISBN13.valid?("978-0-306-40615-7") #=> true
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
    # Transforms a number by appending the ISBN13 checksum digit
    #
    # It will preserve type (Integer/String) and therefore leading zeros.
    #
    # @example
    #   Sjekksum::ISBN13.convert("978-0-306-40615-") #=> "978-0-306-40615-7"
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
