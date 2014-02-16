module Sjekksum
  module Verhoeff
    extend self
    extend Shared

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

    INVERSE = [ 0, 4, 3, 2, 1, 5, 6, 7, 8, 9 ].freeze

    def of input_value
      raise_on_type_mismatch input_value
      digits = input_value.to_s.chars.map(&:to_i)
      INVERSE[digits.reverse_each.with_index.reduce(0) { |check, (digit, idx)|
        d_row = DIHEDRAL_GROUP_D5[check]
        d_row[ PERMUTATION[idx.next % 8][digit] ]
      }]
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
