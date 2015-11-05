require 'card'

describe Card do

  let(:card1) {Card.new(:seven, :clubs)}
  describe "#suit" do
    it "returns the suit of a card" do
      expect(card1.suit).to eq(:clubs)
    end

    it "cannot be changed" do
      expect{card1.suit = :diamonds}.to raise_error(NoMethodError)
    end
  end

  describe "#value" do
    it "returns the value of a card" do
      expect(card1.value).to eq(:seven)
    end

    it "cannot be changed" do
      expect{card1.value = :king}.to raise_error(NoMethodError)
    end


  end


end
