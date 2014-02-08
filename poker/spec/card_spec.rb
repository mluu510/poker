# -*- coding: utf-8 -*-

require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:ace, :hearts) }

  describe "#value" do
    it "should return the value of the card" do
      expect(card.value).to eq(:ace)
    end
  end

  describe "#suit" do
    it "should return the suit of the card" do
      expect(card.suit).to eq(:hearts)
    end
  end

  describe "#to_s" do
    it "should return the string of the card" do
      expect(card.to_s).to eq("A♥")
    end
  end

end