require 'card'


class Deck
  attr_reader :cards

  def initialize
    @cards = []

    Card.values.each do |value_key, _|
      Card.suits.each do |suit_key, _|
        @cards << Card.new(value_key, suit_key)
      end
    end
  end

  def count
    @cards.count
  end

  def deal(num = 1)
    raise "can't deal more cards than the deck has" if @cards.length < num
    raise "cant deal negative number" if num < 0
    [].tap do |dealt_cards|
      num.times do
        dealt_cards << @cards.pop
      end
    end
  end

  def receive_cards(cards)
    @cards += cards
  end

  def shuffle
    @cards.shuffle!
  end


end