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

  let(:junk_cards) { [Card.new(:deuce, :diamonds),
                     Card.new(:three, :hearts),
                     Card.new(:ace, :spades),
                     Card.new(:five, :clubs),
                     Card.new(:six, :diamonds)] }

  describe "::is_flush?" do
    it "should return true if flush" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:five, :diamonds),
               Card.new(:queen, :diamonds),
               Card.new(:nine, :diamonds),
               Card.new(:ace, :diamonds)]
      expect(Hand.is_flush?(cards)).to eq(true)
    end

    it "should return false for incorrect flush" do
      expect(Hand.is_flush?(junk_cards)).to eq(false)
    end
  end

  describe "::is_straight?" do
    it "should return true if straight" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:three, :hearts),
               Card.new(:four, :spades),
               Card.new(:five, :clubs),
               Card.new(:six, :diamonds)]
      expect(Hand.is_straight?(cards)).to eq(true)
    end

    it "should return false for incorrect straight" do
      expect(Hand.is_straight?(junk_cards)).to eq(false)
    end
  end

  describe "::is_four_of_a_kind?" do
    it "should return true if four of a kind" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:deuce, :hearts),
               Card.new(:deuce, :spades),
               Card.new(:deuce, :clubs),
               Card.new(:three, :diamonds)]
      expect(Hand.is_four_of_a_kind?(cards)).to eq(true)
    end

    it "should return false for incorrect four of a kind" do
      expect(Hand.is_four_of_a_kind?(junk_cards)).to eq(false)
    end
  end

  describe "::is_full_house?" do
    it "should return true if full house" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:deuce, :hearts),
               Card.new(:deuce, :spades),
               Card.new(:three, :clubs),
               Card.new(:three, :diamonds)]
      expect(Hand.is_full_house?(cards)).to eq(true)
    end

    it "should return false for incorrect full house" do
      expect(Hand.is_full_house?(junk_cards)).to eq(false)
    end
  end

  describe "::is_three_of_a_kind?" do
    it "should return true if three of a kind" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:deuce, :hearts),
               Card.new(:deuce, :spades),
               Card.new(:three, :clubs),
               Card.new(:three, :diamonds)]
      expect(Hand.is_three_of_a_kind?(cards)).to eq(true)
    end

    it "should return false for incorrect three of a kind" do
      expect(Hand.is_three_of_a_kind?(junk_cards)).to eq(false)
    end
  end

  describe "::is_two_pairs" do
    it "should return true if two pairs" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:deuce, :hearts),
               Card.new(:four, :spades),
               Card.new(:three, :clubs),
               Card.new(:three, :diamonds)]
      expect(Hand.is_two_pairs?(cards)).to eq(true)
    end

    it "should return false for incorrect two pairs" do
      expect(Hand.is_two_pairs?(junk_cards)).to eq(false)
    end
  end

  describe "::is_one_pair" do
    it "should return true if one pair" do
      cards = [Card.new(:deuce, :diamonds),
               Card.new(:deuce, :hearts),
               Card.new(:four, :spades),
               Card.new(:three, :clubs),
               Card.new(:five, :diamonds)]
      expect(Hand.is_one_pair?(cards)).to eq(true)
    end

    it "should return false for incorrect one pair" do
      expect(Hand.is_one_pair?(junk_cards)).to eq(false)
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