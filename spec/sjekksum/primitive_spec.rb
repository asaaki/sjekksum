require "spec_helper"
require "shared_implementation"

describe Sjekksum::Primitive do

  success_spec_matrix = [
    [ 1,      1 ],
    [ 20,     2 ],
    [ 300,    3 ],
    [ 4000,   4 ],
    [ 55555,  7 ],
    [ 424242, 0 ],
    [ 232323, 6 ]
  ]

  fail_spec_matrix = [
    [ 1,      7 ],
    [ 232323, 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
