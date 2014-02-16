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
      raise ArgumentError unless number.is_a?(Integer)
    end

  end
end
