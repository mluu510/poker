require 'rspec'
require 'my_transpose'

describe "#my_transpose" do
  it "should transpose a 2D array" do
    expect([[0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]].my_transpose).to eq([[0, 3, 6],
                                            [1, 4, 7],
                                            [2, 5, 8]])
  end
end