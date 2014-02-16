require "spec_helper"

describe Sjekksum do

  spec_input  = 193435600

  spec_values = {
    damm:        9,
    isbn10:      "X",
    isbn13:      3,
    luhn:        5,
    upc:         3,
    verhoeff:    4,
    primitive:   4,
    primitive97: 7
  }

  specify { expect(described_class).to be_a(Module) }

  spec_values.each do |algo, check|
    final_value = check.is_a?(String) ? "#{spec_input}#{check}" : spec_input * 10 + check

    it "##{algo}" do
      expect(described_class.send(algo, spec_input)).to eq(check)
    end

    it "##{algo}?" do
      expect(described_class.send(:"#{algo}?", final_value)).to be_true
    end

    it "##{algo}!" do
      expect(described_class.send(:"#{algo}!", spec_input)).to eq(final_value)
    end
  end

end
