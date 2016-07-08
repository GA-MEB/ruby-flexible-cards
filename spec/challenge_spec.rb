require_relative '../lib/challenge.rb'

RSpec.describe 'Challenge: ' do
  describe 'Card' do
    before(:all) do
      @card = Card.new(2, :spades)
      @faceCard = Card.new(12, :clubs)
    end
    it 'has a rank and a suit' do
      expect(@card.rank).to eq(2)
      expect(@card.suit).to be(:spades)
    end
    it 'is comparable' do
      expect(@card < @faceCard).to eq(true)
      expect(@card > @faceCard).to eq(false)
      expect(@card == @faceCard).to eq(false)
    end
    describe '#face_card?' do
      it 'returns true/false based on whether the card is/is not a face card' do
        expect(@card.face_card?).to eq(false)
        expect(@faceCard.face_card?).to eq(true)
      end
    end
    describe '#to_s' do
      it 'overrides the default definition, and instead returns a string\
          of the pattern "[name] of [suit]", e.g. "Ace of Spades"' do
        expect(@card.to_s).to eq("2 of Spades")
        expect(@faceCard.to_s).to eq("Queen of Clubs")
      end
    end
  end
  describe 'Deck' do
    before(:all) do
      @deck = Deck.new
    end
    context 'when instantiated' do
      it 'has 52 cards' do
        expect(@deck.cards.length).to eq(52)
      end
      it 'has 13 of each suit' do
        [:spades, :clubs, :diamonds, :hearts].each do |suit|
          expect(@deck.cards.count{|card| card.suit == suit}).to eq(13)
        end
      end
      it 'has 4 of each rank' do
        (1..13).to_a.each do |rank|
          expect(@deck.cards.count{|card| card.rank == rank}).to eq(4)
        end
      end
    end
    describe '#count' do
      it 'returns the number of cards in the deck' do
        expect(@deck.count).to eq(@deck.cards.length)
      end
    end
    describe '#draw' do
      context 'when you draw N cards' do
        before(:all) do
          @old_length = @deck.cards.length
          @num_to_draw = 5
          @drawn_cards = @deck.draw(@num_to_draw)
        end
        it 'removes n cards from the deck' do
          expect(@deck.cards.length).to eq(@old_length - @num_to_draw)
        end
        it 'returns a set of cards' do
          expect(@drawn_cards.class).to eq(Array)
          expect(@drawn_cards.all?{|card| card.class == Card}).to eq(true)
        end
        it 'returns the same number of cards that were removed' do
          expect(@drawn_cards.length).to eq(@num_to_draw)
        end
      end
    end
  end
end
