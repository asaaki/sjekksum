require "spec_helper"
require "shared_implementation"

describe Sjekksum::ISBN10 do

  success_spec_matrix = [
    [ "363941830",     1 ],
    [ "193435600",   "X" ],
    [ 364222974,       3 ],
    [ "345330684",     8 ],
    [ "3-882-21068",   0 ],
    [ 388221591,       7 ],
    [ "359617218",     7 ],
    [ "147743025",     3 ],
    [ "0-306-40615-",  2 ]
  ]

  fail_spec_matrix = [
    [ 123,             9 ],
    [ "123",           9 ],
    [ "147743025",     9 ],
    [ "0-306-40615-",  9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
