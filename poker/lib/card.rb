# -*- coding: utf-8 -*-

class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def to_s
    value = VALUE_STRINGS[self.value]
    suit = SUIT_STRINGS[self.suit]
    "#{value}#{suit}"
  end

  def value_num
    case @value
    when :jack
      11
    when :queen
      12
    when :king
      13
    when :ace
      14
    else
      VALUE_STRINGS[self.value].to_i
    end
  end

  def self.suits
    SUIT_STRINGS
  end

  def self.values
    VALUE_STRINGS
  end

  def <=>(other_card)
    self.value_num <=> other_card.value_num
  end

end