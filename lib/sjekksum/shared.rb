module Sjekksum
  module Shared

  private

    def raise_on_type_mismatch input_value
      raise ArgumentError unless input_value.is_a?(Integer)
    end

  end
end
