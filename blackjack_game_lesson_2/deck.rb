#require_relative 'card'

class Deck
  SUITS = ['H', 'S', 'D', 'C' ]
  VALUES = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  attr_accessor :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end

#deck = Deck.new()
#
#deck.shuffle!
##deck.cards[0]
#puts deck.show_cards
#
#puts deck.cards.size.to_s
#puts deck.deal
#puts deck.deal
#puts deck.cards.size.to_s