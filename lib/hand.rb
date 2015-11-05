
HAND_TYPES = {
              1 => :high_card,
              2 => :one_pair,
              3 => :two_pair,
              4 => :three_of_a_kind,
              5 => :straight,
              6 => :flush,
              7 => :full_house,
              8 => :four_of_a_kind,
              9 => :straight_flush,
              10 => :royal_flush
}

TRICK_SUITS = {
              1 => :diamonds,
              2 => :clubs,
              3 => :hearts,
              4 => :spades
}

VALUES_WORTH = {
              :two => 2,
              :three => 3,
              :four => 4,
              :five => 5,
              :six => 6,
              :seven => 7,
              :eight => 8,
              :nine => 9,
              :ten => 10,
              :jack => 11,
              :queen => 12,
              :king => 13,
              :ace => 14
}


class Hand

  attr_reader :values_hash, :suit_hash, :type
  def initialize(*cards)
    @cards = cards
    @values_hash = Hash.new {|hash, card_value| hash[card_value] = 0 }
    @suit_hash = Hash.new {|hash, card_suit| hash[card_suit] = 0 }
    create_hash
    set_type
  end

  def create_hash
    @cards.each do |card|
      @values_hash[card.value] +=1
      @suit_hash[card.suit] +=1
    end
  end

  def set_duplicate_card_tricks
    if @values_hash.values.max == 4
      @type = :four_of_a_kind
    elsif @values_hash.values.max == 3
      if @values_hash.keys.length == 2
        @type = :full_house
      else
        @type = :three_of_a_kind
      end
    elsif @values_hash.values.max == 2
      @values_hash.keys.length == 3 ? @type = :two_pair : @type = :one_pair
    end
  end

  def set_flush_and_straight
    @type = :flush if is_flush?
    @type = :straight if is_straight?
    @type = :straight_flush if is_flush? && is_straight?
    @type = :royal_flush if is_flush? && is_royal?
  end

  def is_flush?
    @suit_hash.keys.length == 1
  end

  def is_straight?
    #If we have checked duplicate tricks first, we don't have to worry about
    #a hand like 3,4,4,6,7... we can just take highest - lowest == 4
    #to determine if it is a straight
    sorted_values = @values_hash.keys.map { |value| VALUES_WORTH[value] }.sort
    return true if sorted_values == [2, 3, 4, 5, 14]
    values_range = sorted_values.last - sorted_values.first
    values_range == 4 ? true : false
  end

  def is_royal?
    sorted_values = @values_hash.keys.map { |value| VALUES_WORTH[value] }.sort
    is_straight? && sorted_values.first == 10
  end

  def set_type
    set_duplicate_card_tricks
    set_flush_and_straight
  end
end
