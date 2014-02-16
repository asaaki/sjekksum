require "spec_helper"
require "shared_implementation"

describe Sjekksum::Luhn do

  success_spec_matrix = [
    [ 1,          8 ],
    [ 20,         8 ],
    [ 300,        4 ],
    [ 4000,       6 ],
    [ 55555,      7 ],
    [ 424242,     6 ],
    [ 7992739871, 3 ],
  ]

  fail_spec_matrix = [
    [ 1,          1 ],
    [ 7992739871, 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
