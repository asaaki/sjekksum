require "spec_helper"
require "shared_implementation"

describe Sjekksum::Damm do

  success_spec_matrix = [
    [ 1,      3 ],
    [ 20,     7 ],
    [ 300,    9 ],
    [ 4000,   7 ],
    [ 55555,  5 ],
    [ 424242, 0 ],
    [ 572,    4 ],
  ]

  fail_spec_matrix = [
    [ 1,   1 ],
    [ 572, 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
