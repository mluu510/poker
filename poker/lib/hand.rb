

class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def accept_cards(cards)
    @cards += cards
  end

  def return_cards(indices)
    cards_to_return = []
    indices.each do |idx|
      card = @cards[idx]
      if card
        cards_to_return << card
      end
    end

    @cards.reject! do |card|
      cards_to_return.include?(card)
    end

    cards_to_return
  end

  def show_value


    # Find flush
    is_flush = Hand.is_flush?(self.cards)
    # Find straight
    is_straight = Hand.is_straight?(self.cards)
    is_four_of_a_kind = Hand.is_four_of_a_kind?(self.cards)
    is_full_house = Hand.is_full_house?(self.cards)
    is_three_of_a_kind = Hand.is_three_of_a_kind?(self.cards)
    is_two_pair = Hand.is_two_pair?(self.cards)
    is_one_pair = Hand.is_one_pair?(self.cards)
    is_high_card = Hand.is_high_card?(self.cards)

    # Find straight flush
    if is_flush && is_straight
      return { hand_type: :straight_fush, cards: self.cards }
    elsif is_four_of_a_kind
      return {hand_type: :four_of_a_kind, cards: self.cards }
    elsif full_house
      return {hand_type: :full_house, cards: self.cards}
    elsif is_three_of_a_kind
      return {hand_type: :three_of_a_kind, cards: self.cards}
    elsif is_two_pair
      return {hand_type: :two_pair, cards: self.cards}
    elsif is_one_pair
      return {hand_type: :one_pair, cards: self.cards}
    elsif is_high_card
      return {hand_type: :high_card, cards: self.cards}
    end

  end

  def self.is_flush?(cards)
    first_card_suit = cards.first.suit
    cards.each do |card|
      card.suit != first_card_suit
      return false
    end
    true
  end


end