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
      [1,11]
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

puts "what is your name?"
name = gets.chomp

puts "Hi, #{name}"
puts 'Are you ready to play blackjack? (Y/N)'
ready = gets.chomp
if ready.upcase != 'Y'
  puts "Ok, have a great day."
  exit
end

def transition(time=2)
  sleep time
end

puts "---------------------------------------------"
puts "Getting a new deck of cards"
deck = new_deck
transition
puts "Shuffling"
deck = deck.shuffle
dealer_count = 0

hit = deal(deck)
dealer_count += hit.first.to_blackjack
puts "DEALER: #{hit.join(' of ')} COUNT: #{dealer_count}"
transition
hit = deal(deck)
dealer_count += hit.first.to_blackjack
puts "DEALER: #{hit.join(' of ')} COUNT: #{dealer_count}"
transition

player_count = 0
hit = deal(deck)
player_count += hit.first.to_blackjack
puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
transition
hit = deal(deck)
player_count += hit.first.to_blackjack
puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
transition

puts "What do you want to do? (hit/stay)"
transition
next_action = gets.chomp
if next_action.downcase == 'hit'
  hit = deal(deck)
  player_count += hit.first.to_blackjack
  puts "#{name.upcase}: #{hit.join(' of ')} COUNT: #{player_count}"
  transition
else
  puts "DEALER: #{dealer_count} vs. #{name.upcase}: #{player_count}"
end



#
#puts deal.to_s
#puts deck.size.to_s
#
#puts deal.to_s
#puts deck.size.to_s

#sum = deal.to_s
#sum = sum + deal[0]

#ace_sum
#no_ace_sum

#if ace keep to counts







