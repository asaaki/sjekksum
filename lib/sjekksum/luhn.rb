module Sjekksum
  module Luhn
    extend self
    extend Shared

    def of input_value
      raise_on_type_mismatch input_value
      digits = input_value.to_s.chars.map(&:to_i)
      sum    = digits.reverse.map.with_index do |digit, idx|
        idx.even? ? (digit * 2).divmod(10).reduce(&:+) : digit
      end.reverse.reduce(&:+)

      (10 - sum % 10) % 10
    end

    def valid? input_value
      raise_on_type_mismatch input_value
      self.of(input_value.div(10)) == (input_value % 10)
    end

    def convert input_value
      raise_on_type_mismatch input_value
      (input_value * 10) + self.of(input_value)
    end
  end
end
