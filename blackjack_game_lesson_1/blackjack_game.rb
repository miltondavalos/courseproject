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
      1#[1,11]
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

def who_wins(player_count, dealer_count)
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
puts "what is your name?"
name = gets.chomp

puts "Hi, #{name}"
puts 'Are you ready to play blackjack? (Y/N)'
ready = gets.chomp

if ready.upcase != 'Y'
  puts "Ok, have a great day."
  exit
end

puts "Getting a new deck of cards"
deck = new_deck
transition
puts "Shuffling"
deck = deck.shuffle

$dealer_count = 0
$player_count = 0

def dealing_to(who, deck)
  counter = eval("$#{who}_count")
  hit = deal(deck)
  counter += hit.first.to_blackjack
  puts "#{who.upcase}: #{hit.join(' of ')} COUNT: #{counter}"
  transition
  eval("$#{who}_count = #{counter}")
  #hit = deal(deck)
  #counter += hit.first.to_blackjack
  #puts "#{who.upcase}: #{hit.join(' of ')} COUNT: #{counter}"
  #transition
end
#---------------------------------------------------------------------
#dealer_count = 0
#hit = deal(deck)
#dealer_count += hit.first.to_blackjack
#puts "DEALER: #{hit.join(' of ')} COUNT: #{dealer_count}"
#transition
#hit = deal(deck)
#dealer_count += hit.first.to_blackjack
#puts "DEALER: #{hit.join(' of ')} COUNT: #{dealer_count}"
#transition
dealing_to('dealer', deck)
puts  "#{$dealer_count}"
dealing_to('dealer', deck)
dealer_count = $dealer_count
#------------------------------------------------------------------------
player_count = 0
hit = deal(deck)
player_count += hit.first.to_blackjack
puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
transition
hit = deal(deck)
player_count += hit.first.to_blackjack
puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
transition
#-------------------------------------------------------------------------
next_action = 'hit'
while next_action.downcase == 'hit' && player_count < 22 do
  puts "What do you want to do? (hit/stay)"
  transition
  next_action = gets.chomp
  if next_action.downcase == 'hit'
    hit = deal(deck)
    player_count += hit.first.to_blackjack
    puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
    transition
  else
    #puts "DEALER: #{dealer_count} vs. #{name.upcase}: #{player_count}"
    while ((dealer_count < player_count) && (dealer_count << 22)) || (dealer_count < player_count) do
      hit = deal(deck)
      dealer_count += hit.first.to_blackjack
      puts "DEALER: #{hit.join(' of ')} COUNT: #{dealer_count}"
      transition
    end
  end
end

who_wins(player_count, dealer_count)

play_again = 'y'
while play_again.downcase == 'y'
  puts "Do you want to play again? (Y/N)"
  play_again = gets.chomp
  if play_again.downcase == 'y'
    puts "TODO...need to write code..."
  else
    puts "bye bye"
  end
end








