require "sjekksum/version"

require "sjekksum/shared"
require "sjekksum/damm"
require "sjekksum/luhn"
require "sjekksum/verhoeff"

module Sjekksum
  extend self

  def damm_of input_value
    Damm.of input_value
  end
  alias_method :damm, :damm_of

  def luhn_of input_value
    Luhn.of input_value
  end
  alias_method :luhn, :luhn_of

  def verhoeff_of input_value
    Verhoeff.of input_value
  end
  alias_method :verhoeff, :verhoeff_of

  def valid_damm? input_value
    Damm.valid? input_value
  end
  alias_method :damm?, :valid_damm?

  def valid_luhn? input_value
    Luhn.valid? input_value
  end
  alias_method :luhn?, :valid_luhn?

  def valid_verhoeff? input_value
    Verhoeff.valid? input_value
  end
  alias_method :verhoeff?, :valid_verhoeff?

  def make_damm input_value
    Damm.convert input_value
  end
  alias_method :damm!, :make_damm

  def make_luhn input_value
    Luhn.convert input_value
  end
  alias_method :luhn!, :make_luhn

  def make_verhoeff input_value
    Verhoeff.convert input_value
  end
  alias_method :verhoeff!, :make_verhoeff

end
