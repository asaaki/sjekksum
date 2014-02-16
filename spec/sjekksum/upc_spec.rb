require "spec_helper"
require "shared_implementation"

describe Sjekksum::UPC do

  success_spec_matrix = [
    [ 1,                7 ],
    [ 20,               4 ],
    [ 300,              1 ],
    [ 4000,             8 ],
    [ 55555,            5 ],
    [ 424242,           8 ],
    [ 3600024145,       3 ],
    [ "03600024145",    7 ],
    [ "036 000-241.45", 7 ]
  ]

  fail_spec_matrix = [
    [ 1,                1 ],
    [ 3600024145,       7 ],
    [ "03600024145",    9 ],
    [ "036 000-241.45", 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
