require_relative 'hand'

class Dealer
  include Hand
  attr_accessor :name, :cards

  def initialize(name= 'Dealer')
    @cards = []
    @name = name
  end

  def show_flop
    puts "----Dealer's Hand----"
    puts "first card *******"
    puts "second card #{cards[1]}"
  end
end
