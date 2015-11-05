require_relative 'card'

SUITS = [:spades, :hearts, :clubs, :diamonds]
VALUES = [:two,
          :three,
          :four,
          :five,
          :six,
          :seven,
          :eight,
          :nine,
          :ten,
          :jack,
          :queen,
          :king,
          :ace,
          ]

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    fill_deck
  end

  def fill_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @cards = @cards.shuffle
  end

end
