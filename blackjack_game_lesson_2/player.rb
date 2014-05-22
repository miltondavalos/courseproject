require_relative 'hand'

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @cards = []
    @name = name
  end

  def show_flop
    show_hand
  end
end
