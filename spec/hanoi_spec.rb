require 'rspec'
require 'hanoi'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }

  describe "#render" do
    it "should display the game board" do
      expect(hanoi.render).to eq("321\n---\n---")
    end
  end

  describe "#move" do
    it "should move the disc from one tower to another" do
      hanoi.move(0,1)
      expect(hanoi.render).to eq("32-\n1--\n---")
    end

    it "should not allow you to put a bigger disk on a smaller disk" do
      hanoi.move(0,1)
      expect{ hanoi.move(0,1) }.to raise_error
    end
  end

  describe "#won?" do
    it "should return true when all disks are on last stick" do
      hanoi.move(0,2)
      hanoi.move(0,1)
      hanoi.move(2,1)
      hanoi.move(0,2)
      hanoi.move(1,0)
      hanoi.move(1,2)
      hanoi.move(0,2)
      expect(hanoi.won?).to eq(true)
    end

    it "should return false when the game isn't over" do
      hanoi.move(0,2)
      expect(hanoi.won?).to eq(false)
    end
  end

end