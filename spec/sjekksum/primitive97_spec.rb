require "spec_helper"
require "shared_implementation"

describe Sjekksum::Primitive97 do

  success_spec_matrix = [
    [ 1,          1 ],
    [ 20,         2 ],
    [ 300,        0 ],
    [ 4000,       5 ],
    [ 55555,      8 ],
    [ 424242,     7 ],
    [ 23569,      5 ],
    [ "23569",    5 ],
    [ "23.5-69",  5 ]
  ]

  fail_spec_matrix = [
    [ 1,          7 ],
    [ 23569,      9 ],
    [ "23569",    9 ],
    [ "23.5-69",  9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
