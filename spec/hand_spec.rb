load 'card.rb'
load 'hand.rb'

describe Hand do
  let(:two_clubs) {Card.new(:two, :clubs)}
  let(:two_spades) {Card.new(:two, :spades)}
  let(:three_clubs) {Card.new(:three, :clubs)}
  let(:four_clubs) {Card.new(:four, :clubs)}
  let(:five_clubs) {Card.new(:five, :clubs)}
  let(:hand) {Hand.new(card1, card2, card3, card4, card5)}
  let(:two_of_a_kind_hand) {Hand.new(two_clubs, two_spades, three_clubs, four_clubs, five_clubs)}
  # let(:three_of_a_kind)
  #   {Hand.new(two_clubs, two_spades, two_hearts, three_clubs, four_clubs)}

  # let(:two_of_a_kind_hand) {double('hand', :type => two_of_a_kind)}
  # let(:full_house_hand) {double('hand', :type => full_house)}

  # describe "#cards"
  #
  #   it "has five cards" do
  #     expect(hand.card.count).to eq(5)
  #   end
  #
  # end
  #
  # describe "#discard_and_draw" do
  #
  #   it "removes the arguments from the hand" do
  #     hand.discard_and_draw([1,3])
  #     expect(hand.cards).not_to include(card2, card4)
  #   end
  #
  #   it "maintain the card count" do
  #     hand.discard_and_draw([1,3])
  #     expect(hand.cards.count).to eq(5)
  #   end
  #
  # end
  #
  # describe "#Hand::compare" do
  #
  #   it "prefers two pair over one pair" do
  #     expect(Hand.compare(two_pair_hand, one_pair_hand)).to
  #       eq(two_pair_hand)
  #   end
  #
  #   it "prefers 3 of a kind over all lower tricks" do
  #     (1..3).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, three_of_a_kind_hand)).to
  #         eq(three_of_a_kind_hand)
  #     end
  #   end
  #
  #   it "prefers straight over all lower tricks" do
  #     (1..4).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, straight_hand)).to
  #         eq(straight_hand)
  #     end
  #   end
  #
  #   it "prefers flush over all lower tricks" do
  #     (1..5).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, flush_hand)).to
  #         eq(flush_hand)
  #     end
  #   end
  #
  #   it "prefers full_house over all lower tricks" do
  #     (1..6).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, full_house_hand)).to
  #         eq(full_house_hand)
  #     end
  #   end
  #
  #   it "prefers four of a kind over all lower tricks" do
  #     (1..7).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, four_of_a_kind_hand)).to
  #         eq(four_of_a_kind_hand)
  #     end
  #   end
  #
  #   it "prefers straight flush over all lower tricks" do
  #     (1..8).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, straight_flush_hand)).to
  #         eq(straight_flush_hand)
  #     end
  #   end
  #
  #   it "prefers royal flush over all lower tricks" do
  #     (1..9).each do |hand_index|
  #       lower_hand = HAND_TYPES[hand_index]
  #       expect(Hand.compare(lower_hand, royal_flush_hand)).to
  #         eq(royal_flush_hand)
  #     end
  #   end
  #
  #   # test suit comparisons later
  # end

  describe "#values_hash" do
    it "collects the values and how many times they occur" do
      expect(two_of_a_kind_hand.values_hash).to eq({:two => 2, :three => 1, :four => 1, :five => 1})
    end
  end

  describe "#suits_hash" do
    it "returns the number of occurances of each suit" do
      expect(two_of_a_kind_hand.suit_hash).to eq({:clubs => 4, :spades => 1})
    end
  end

  describe "#duplicate_card_tricks" do
    it "recognizes a pair" do
      expect(two_of_a_kind_hand.type).to eq(:one_pair)
    end
  end

end
