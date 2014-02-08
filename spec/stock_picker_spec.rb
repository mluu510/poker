require 'rspec'
require 'stock_picker'

describe 'stock_picker' do
  it "should take an array of stock prices and outputs the most profitable pair of days" do
    expect(stock_picker([9,1,6,2,4,8,0])).to eq([1,5])
  end
end
