require "spec_helper"

describe Sjekksum do

  spec_values = {
    input: 12345,
    damm: 9,
    luhn: 5,
    verhoeff: 1
  }

  specify { expect(described_class).to be_a(Module) }

  it "#damm" do
    expected = spec_values[:input] * 10 + spec_values[:damm]
    expect(described_class.damm(spec_values[:input])).to eq(spec_values[:damm])
  end

  it "#damm?" do
    value = spec_values[:input] * 10 + spec_values[:damm]
    expect(described_class.damm?(value)).to be_true
  end

  it "#damm!" do
    expected = spec_values[:input] * 10 + spec_values[:damm]
    expect(described_class.damm!(spec_values[:input])).to eq(expected)
  end

  it "#luhn" do
    expected = spec_values[:input] * 10 + spec_values[:luhn]
    expect(described_class.luhn(spec_values[:input])).to eq(spec_values[:luhn])
  end

  it "#luhn?" do
    value = spec_values[:input] * 10 + spec_values[:luhn]
    expect(described_class.luhn?(value)).to be_true
  end

  it "#luhn!" do
    expected = spec_values[:input] * 10 + spec_values[:luhn]
    expect(described_class.luhn!(spec_values[:input])).to eq(expected)
  end

  it "#verhoeff" do
    expected = spec_values[:input] * 10 + spec_values[:verhoeff]
    expect(described_class.verhoeff(spec_values[:input])).to eq(spec_values[:verhoeff])
  end

  it "#verhoeff?" do
    value = spec_values[:input] * 10 + spec_values[:verhoeff]
    expect(described_class.verhoeff?(value)).to be_true
  end

  it "#verhoeff!" do
    expected = spec_values[:input] * 10 + spec_values[:verhoeff]
    expect(described_class.verhoeff!(spec_values[:input])).to eq(expected)
  end

end
