module Sjekksum
  #
  # Shared helper methods
  #
  module Shared

  private

    #
    # Checks input type and raises if requirement is not met (currently the value has to be an integer)
    # @param  number [Object]
    def raise_on_type_mismatch number
      raise ArgumentError unless number.is_a?(Integer) or number.is_a?(String)
    end

    def convert_number_to_digits number
      number.to_s.scan(/\d/).map{ |b| b.chr.to_i }
    end

    def convert_to_int number
      convert_number_to_digits(number).join.to_i
    end

    def split_number number
      if number.is_a?(String)
        [ number[0..-2], number[-1].to_i ]
      else
        number.divmod(10)
      end
    end

    def typed_conversion number
      if number.is_a?(String)
        number << self.of(number).to_s
      else
        convert_to_int(number) * 10 + self.of(number)
      end
    end

  end
end
