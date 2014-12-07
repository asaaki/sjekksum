shared_examples "a checksum implementation:" do |success_spec_matrix, fail_spec_matrix|

  describe "of" do
    success_spec_matrix.each do |spec_item|
      it "calculates checksum: #{spec_item[0]} => #{spec_item[1]}" do
        expect(described_class.of(spec_item[0])).to eq(spec_item[1])
      end
    end

    fail_spec_matrix.each do |spec_item|
      it "does not calculate checksum: #{spec_item[0]} => #{spec_item[1]}" do
        expect(described_class.of(spec_item[0])).to_not eq(spec_item[1])
      end
    end
  end

  describe "valid?" do
    success_spec_matrix.each do |spec_item|
      spec_value = transform_spec_value(spec_item[0],spec_item[1])
      it "returns true for #{spec_value}" do
        expect(described_class.valid?(spec_value)).to be_truthy
      end
    end

    fail_spec_matrix.each do |spec_item|
      spec_value = transform_spec_value(spec_item[0],spec_item[1])
      it "does not return true for #{spec_value}" do
        expect(described_class.valid?(spec_value)).to_not be_truthy
      end
    end
  end

  describe "convert" do
    success_spec_matrix.each do |spec_item|
      spec_value = transform_spec_value(spec_item[0],spec_item[1])
      it "transforms #{spec_item[0]} to #{spec_value}" do
        expect(described_class.convert(spec_item[0])).to eq(spec_value)
      end
    end

    fail_spec_matrix.each do |spec_item|
      spec_value = transform_spec_value(spec_item[0],spec_item[1])
      it "does not transform #{spec_item[0]} to #{spec_value}" do
        expect(described_class.convert(spec_item[0])).to_not eq(spec_value)
      end
    end
  end

  context "invalid input" do
    [12.34, true, false, nil, {}, [], Proc.new{}, Class.new, Module.new].each do |invalid_input|
      it "#of raises an ArgumentError for #{invalid_input.inspect} (type: #{invalid_input.class})" do
        expect{ described_class.of(invalid_input) }.to raise_error(ArgumentError)
      end
      it "#valid? raises an ArgumentError for #{invalid_input.inspect} (type: #{invalid_input.class})" do
        expect{ described_class.valid?(invalid_input) }.to raise_error(ArgumentError)
      end
      it "#convert raises an ArgumentError for #{invalid_input.inspect} (type: #{invalid_input.class})" do
        expect{ described_class.convert(invalid_input) }.to raise_error(ArgumentError)
      end

    end
  end

end
