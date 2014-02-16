require "spec_helper"
require "shared_implementation"

describe Sjekksum::ISBN13 do

  success_spec_matrix = [
    [ "978-363941830", 9 ],
    [ "978-193435600", 5 ],
    [ 978364222974,    9 ],
    [ "978345330684",  4 ],
    [ "978-388221068", 2 ],
    [ 978388221591,    5 ],
    [ "978-359617218", 4 ],
    [ "978-147743025", 5 ],
    [ "978-030640615", 7 ]
  ]

  fail_spec_matrix = [
    [ 123,             9 ],
    [ "123",           9 ],
    [ "978-147743025", 9 ],
    [ "978-030640615", 9 ]
  ]

  it_behaves_like "a checksum implementation:", success_spec_matrix, fail_spec_matrix

end
