require 'rspec'
require 'two_sum'

describe "#two_sum" do
  it "should finds all pairs of positions where the elements at those positions sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end