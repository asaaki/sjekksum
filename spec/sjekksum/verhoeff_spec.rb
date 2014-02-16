require "spec_helper"
require "shared_implementation"

describe Sjekksum::Verhoeff do

  success_spec_matrix = [
    [ 1,      5 ],
    [ 20,     4 ],
    [ 300,    0 ],
    [ 4000,   1 ],
    [ 55555,  7 ],
    [ 424242, 3 ],
    [ 142857, 0 ]
  ]

  fail_spec_matrix = [
    [ 1,      1 ],
    [ 142857, 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
