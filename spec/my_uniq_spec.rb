require 'rspec'
require 'my_uniq'

describe "#my_uniq" do
  it "should return a unique arrray" do
    expect([1, 1, 2, 2, 3, 3].my_uniq).to eq([1, 2, 3])
  end
end