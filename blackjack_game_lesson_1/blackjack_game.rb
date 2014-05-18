def new_deck
  values = ['1','2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
  suits = ['Hearts', 'Spades', 'Diamonds', 'Clubs' ]

  values.product suits
end

def deal(deck)
  deck.pop
end

class String
  def to_blackjack
    if self.downcase == 'ace'
      'A'
    elsif self.downcase == 'jack'
      10
    elsif self.downcase == 'queen'
      10
    elsif self.downcase == 'king'
      10
    else
      self.to_i
    end
  end
end

def transition(time=1)
  sleep time
end

def determine_winner(result)
  player_count = result[:player_total]
  dealer_count = result[:dealer_total]

  if player_count > 21
    puts "YOU LOST! -- #{player_count} vs. #{dealer_count}"
  elsif player_count == dealer_count
    puts "YOU LOST! -- #{player_count} vs. #{dealer_count}"
  elsif dealer_count > 21
    puts "YOU WIN! -- #{player_count} vs. #{dealer_count}"
  elsif dealer_count <= 21 && dealer_count >= player_count
    puts "YOU LOST! -- #{player_count} vs. #{dealer_count}"
  elsif player_count <= 21 && dealer_count < player_count
    puts "YOU WIN! -- #{player_count} vs. #{dealer_count}"
  end
end

def dealing_to(who, deck)
  hit = deal(deck)
  puts '----------------------------------'
  puts "#{who.upcase}: #{hit.join(' of ')}"
  puts '----------------------------------'
  transition
  hit.first.to_blackjack
end

def your_score(player_total)
  puts '----------------------------------'
  puts "YOUR SCORE: #{total(player_total)}"
  puts '----------------------------------'
end

def total(cards)
  counter = 0
  cards.each do |card|
    if card == 'A'
      counter += 11
    else
      counter += card
    end
  end
  cards.select{|e| e == "A"}.count.times{counter -= 10 if counter > 21}
  counter
end

def new_deck_of_cards
  puts "Got a new deck of cards"
  new_deck
end

def shuffle(deck)
  puts "Shuffling"
  deck.shuffle!.shuffle!.shuffle!
end

def next_action(player_total, dealer_total, deck)
  next_action = 'hit'
  while next_action.downcase == 'hit' && total(player_total) < 22 do
    puts "What do you want to do? (hit/stay)"
    transition
    next_action = gets.chomp
    if next_action.downcase == 'hit'
      player_total << dealing_to('you', deck)
      your_score(player_total)
    else
      while total(dealer_total) <= 17 do
        dealer_total  << dealing_to('dealer', deck)
      end
    end
  end
  {player_total: total(player_total), dealer_total: total(dealer_total)}
end

def exit_game
  puts "Ok, have a great day."
  exit
end

def play
  @deck = nil
  dealer_total = []
  player_total = []
  @deck = shuffle(new_deck_of_cards)
  dealer_total << dealing_to('dealer', @deck)
  player_total << dealing_to('you', @deck)
  dealer_total << dealing_to('dealer', @deck)
  player_total << dealing_to('you', @deck)
  your_score(player_total)
  result = next_action(player_total, dealer_total, @deck)
  determine_winner(result)
end


puts "what is your name?"
name = gets.chomp
puts "Hi, #{name}"
puts 'Are you ready to play blackjack? (Y/N)'
ready = gets.chomp
exit_game if ready.upcase != 'Y'
play

play_again = 'y'
while play_again.downcase == 'y'
  puts "Do you want to play again? (Y/N)"
  play_again = gets.chomp
  if play_again.downcase == 'y'
    play
  else
    puts "Come again soon!"
  end
end








