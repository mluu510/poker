require 'rspec'
require 'hand'
require 'deck'

describe Hand do
  subject(:hand) { Hand.new }
  let(:deck) { Deck.new }

  describe "#accept_cards" do
    it "should be able to accept cards" do
      original_hand_count = hand.cards.count
      hand.accept_cards(deck.deal(3))
      expect(hand.cards.count).to eq(original_hand_count + 3)
    end
  end

  describe "#return_cards" do
    it "should return the card to the deck" do
      cards = deck.deal(5)
      hand.accept_cards(cards)
      returned_cards = hand.return_cards([1,3])

      expect(returned_cards.length).to eq(2)
      expect(hand.cards.length).to eq(3)

      returned_cards.each do |card|
        expect(card.class).to eq(Card)
      end
    end
  end


  describe "#show_value" do
    # it "should return the hash value of a royal flush" do
    #   cards = [Card.new(:ten, :diamonds),
    #            Card.new(:jack, :diamonds),
    #            Card.new(:queen, :diamonds),
    #            Card.new(:king, :diamonds),
    #            Card.new(:ace, :diamonds)]
    #   hand.accept_cards(cards)
    #   expect(hand.show_value).to eq({ hand_type: :straight_flush, cards: hand.cards })
    # end
    #
    # it "should return the value of the hand" do
    #   pair_hand = [Card.new(:three, :diamonds),
    #                Card.new(:jack, :hearts),
    #                Card.new(:jack, :diamonds),
    #                Card.new(:four, :hearts),
    #                Card.new(:five, :diamonds)]
    #   hand.accept_cards(pair_hand)
    #   expect(hand.show_value).to eq({ hand_type: :pair, pair_value: :jack, cards: hand.cards })
    # end
  end

end