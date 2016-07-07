
# This class represents a playing card, with a rank and a suit.
class Card
  attr_accessor :rank, :suit
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    rank > 10
  end

  def to_s
    name = @rank.to_s
    # if @rank == 1
    #   name = 'Ace'
    # end
    # if @rank == 11
    #   name = 'Jack'
    # end
    # if @rank == 12
    #   name = 'Queen'
    # end
    # if @rank == 13
    #   name = 'King'
    # end
    name = 'Ace' if @rank == 1
    name = 'Jack' if @rank == 11
    name = 'Queen' if @rank == 12
    name = 'King' if @rank == 13

    ## Alternative approach
    # special_names = { 1 => 'Ace', 11 => 'Jack', 12 => 'Queen', 13 => 'King' }
    # name = special_names[@rank] || @rank.to_s
    "#{name} of #{@suit.to_s.capitalize}"
  end

  def <=>(other)
    return -1 if @rank < other.rank
    return 1 if @rank > other.rank
    0 # return 0

    ## Alternatives:
    # (@rank < other.rank) ? -1 : (@rank > other.rank) ? 1 : 0
    # @rank <=> other.rank
  end
end

# This class represents a deck of playing cards, using the Card class above.
class Deck
  attr_accessor :cards
  def initialize
    combinations = [:spades, :clubs, :diamonds, :hearts].product((1..13).to_a)
    # result of .product is
    # [[:spades, 1], [:spades, 2], ..., [:clubs, 1], [:clubs, :2], ...]
    @cards = combinations.map { |suit, rank| Card.new(rank, suit) }
  end

  def count
    @cards.length
  end

  def draw(n)
    @cards.slice!(-1 * n, n)
  end

  def shuffle
    @cards.shuffle
  end
end
