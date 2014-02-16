module Sjekksum
  #
  # Module for calculation and validation of ISBN 10 (International Standard Book Number) checksums
  #
  # @see http://en.wikipedia.org/wiki/International_Standard_Book_Number#ISBN-10_check_digit_calculation ISBN-10 check digit calculation
  #
  module ISBN10
    extend self
    extend Shared

    #
    # Calculates ISBN 10 checksum
    #
    # @example
    #   Sjekksum::ISBN10.of("147743025") #=> 3
    #   Sjekksum::ISBN10.of("193435600") #=> "X"
    #
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer, String] calculated checksum
    def of number
      raise_on_type_mismatch number
      digits = convert_number_to_digits(number)[0..9]
      sum    = digits.reverse_each.with_index.reduce(0) do |check, (digit, idx)|
        check += digit * (idx+2)
      end
      check = (11 - sum % 11) % 11
      check == 10 ? "X" : check
    end
    alias_method :checksum, :of

    #
    # ISBN 10 validation of provided number
    #
    # @example
    #   Sjekksum::ISBN10.valid?("1477430253") #=> true
    #   Sjekksum::ISBN10.valid?("193435600X") #=> true
    #
    # @param  number [Integer, String] number with included checksum
    #
    # @return [Boolean]
    def valid? number
      raise_on_type_mismatch number
      num, check = split_isbn_number(number)
      convert_number_to_digits(num).length == 9 && self.of(num) == check
    end
    alias_method :is_valid?, :valid?

    #
    # Transforms a number by appending the ISBN 10 checksum digit
    #
    # @example
    #   Sjekksum::ISBN10.convert("147743025") #=> "1477430253"
    #   Sjekksum::ISBN10.convert("193435600") #=> "193435600X"
    #
    # @param  number [Integer, String] number without a checksum
    #
    # @return [Integer, String] final number including the checksum
    def convert number
      raise_on_type_mismatch number
      check = self.of(number)
      if number.is_a?(String) or check.is_a?(String)
        number.to_s << self.of(number).to_s
      else
        convert_to_int(number) * 10 + self.of(number)
      end
    end
    alias_method :transform, :convert

  private

    #
    # [split_isbn_number description]
    # @param  number [type] [description]
    #
    # @return [type] [description]
    def split_isbn_number number
      if number.is_a?(String)
        [ number[0..-2], (%w[X x].include?(number[-1]) ? "X" : number[-1].to_i) ]
      else
        number.divmod(10)
      end
    end

  end
end
