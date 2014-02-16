# coding: utf-8
require "sjekksum"

module SjekksumRSpecHelpers
  def transform_spec_value origin_value, check_digit
    if origin_value.is_a?(String)
      "#{origin_value}#{check_digit}"
    else
      origin_value * 10 + check_digit
    end
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_with :rspec do |c|
    c.syntax = :expect
  end
  config.include SjekksumRSpecHelpers
  config.extend  SjekksumRSpecHelpers
end
