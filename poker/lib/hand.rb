

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
    is_two_pair = Hand.is_two_pairs?(self.cards)
    is_one_pair = Hand.is_one_pair?(self.cards)

    # Find straight flush
    if is_flush && is_straight
      return { hand_type: :straight_fush, cards: self.cards }
    elsif is_four_of_a_kind
      return { hand_type: :four_of_a_kind, cards: self.cards }
    elsif is_full_house
      return { hand_type: :full_house, cards: self.cards }
    elsif is_flush
      return { hand_type: :flush, cards: self.cards }
    elsif is_straight
      return { hand_type: :straight, cards: self.cards }
    elsif is_three_of_a_kind
      return { hand_type: :three_of_a_kind, cards: self.cards }
    elsif is_two_pair
      return { hand_type: :two_pair, cards: self.cards }
    elsif is_one_pair
      return { hand_type: :one_pair, cards: self.cards }
    else
      return { hand_type: :high_card, cards: self.cards }
    end
  end

  def self.is_flush?(cards)
    first_card_suit = cards.first.suit
    cards.each do |card|
      return false if card.suit != first_card_suit
    end
    true
  end

  def self.is_straight?(cards)
    sorted_cards = cards.sort
    sorted_cards.each_with_index do |this_card, idx|
      next_card = sorted_cards[idx+1]
      next if next_card.nil?
      return false if this_card.value_num + 1 != next_card.value_num
    end
    true
  end

  def self.is_four_of_a_kind?(cards)
    card_hash = Hand.calculate_card_hash(cards)
    return true if card_hash.values.include?(4)
    false
  end

  def self.is_full_house?(cards)
    card_hash = Hand.calculate_card_hash(cards)
    return true if card_hash.values.include?(3) && card_hash.values.include?(2)
    false
  end

  def self.is_three_of_a_kind?(cards)
    card_hash = Hand.calculate_card_hash(cards)
    return true if card_hash.values.include?(3)
    false
  end

  def self.is_two_pairs?(cards)
    card_hash = self.calculate_card_hash(cards)
    sum = 0
    card_hash.each do |key, value|
      sum +=1 if card_hash[key] == 2
    end
    return true if sum == 2
    false
  end

  def self.is_one_pair?(cards)
    card_hash = self.calculate_card_hash(cards)
    return true if card_hash.values.include?(2)
    false
  end

  private
  def self.calculate_card_hash(cards)
    card_hash = Hash.new(0)
    cards.each do |card|
      card_hash[card.value] += 1
    end
    card_hash
  end
end