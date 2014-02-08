# -*- coding: utf-8 -*-

require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#count" do
    it "should return 52 cards in a standard playing card deck" do
      expect(deck.count).to eq(52)
    end
  end

  describe "#deal" do
    it "should deal one card" do
      cards = deck.deal
      expect(cards.class).to eq(Array)
      cards.each do |card|
        expect(card.class).to eq(Card)
      end
      expect(deck.count).to eq(51)
    end

    it "should deal three cards" do
      cards = deck.deal(3)
      expect(deck.count).to eq(49)
      expect(cards.length).to eq(3)
      cards.each do |card|
        expect(card.class).to eq(Card)
      end
    end

    it "should raise an error if deck doesn't have enough cards" do
      expect{ deck.deal(100) }.to raise_error
    end
  end

  let(:cards) { [Card.new(:ace, :spades), Card.new(:deuce, :diamonds), Card.new(:king, :hearts)] }

  describe "#receive_cards" do
    it "should receive the cards and add it to the deck" do
      original_deck_count = deck.count
      deck.receive_cards(cards)
      expect(deck.count).to eq(original_deck_count + cards.count)
    end
  end

  describe "#shuffle" do
    it "should shuffle the deck" do
      all_cards = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq(all_cards)
    end
  end

end


