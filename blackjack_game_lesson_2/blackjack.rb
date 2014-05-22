require_relative 'card'
require_relative 'deck'
require_relative 'dealer'
require_relative 'player'

class Blackjack
  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  attr_accessor :deck, :dealer, :player

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new('')
  end

  def player_name
    puts "What's your name?"
    self.player.name= gets.chomp
  end
  def first_deal
    2.times{[self.player, self.dealer].each {|man| man.send('add_card', @deck.deal)}}
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, dealer hit blackjack. #{player.name} loses."
      else
        puts "Congratulations, you hit blackjack! #{player.name} win!"
      end
      play_again?
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Congratulations, dealer busted. #{player.name} win!"
      else
        puts "Sorry, #{player.name} busted. #{player.name} loses."
      end
      play_again?
    end
  end

  def player_turn
    puts "#{player.name}'s turn."

    blackjack_or_bust?(player)

    while !player.is_busted?
      puts "What would you like to do? 1) hit 2) stay"
      response = gets.chomp

      if !['1', '2'].include?(response)
        puts "Error: you must enter 1 or 2"
        next
      end

      if response == '2'
        puts "#{player.name} chose to stay."
        break
      end

      #hit
      new_card = deck.deal
      puts "Dealing card to #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total is now: #{player.total}"

      blackjack_or_bust?(player)
    end
    puts "#{player.name} stays at #{player.total}."
  end

  def dealer_turn
    puts "Dealer's turn."

    blackjack_or_bust?(dealer)
    while dealer.total < DEALER_HIT_MIN
      new_card = deck.deal
      puts "Dealing card to dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now: #{dealer.total}"

      blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulations, #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry, #{player.name} loses."
    else
      puts "It's a tie!"
    end
    play_again?
  end

  def play_again?
    puts ""
    puts "Would you like to play again? 1) yes 2) no, exit"
    if gets.chomp == '1'
      puts "Starting new game..."
      puts ""
      #deck = Deck.new
      Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye!"
      exit
    end
  end

  def start
    player_name
    first_deal
    show_flop
    player_turn
    dealer_turn
    who_won?
  end
end