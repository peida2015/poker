require 'card'
require 'deck'

describe Deck do
  let(:deck) {Deck.new}
  # let(:random_card1) {Card.new(:diamonds, :jack)}
  # let(:random_card2) {Card.new(:spades, :three)}
  # let(:random_card3) {Card.new(:clubs, :ace)}

  describe "#cards" do
    it "initializes with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "contains all cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  # describe "#shuffle" do
  #   it "shuffles the deck into a random order"
  #
  #
  # end
end
