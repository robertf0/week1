def say(statement)
  puts "<<<<< #{statement} >>>>>"
end

def ask(question)
  puts "????? #{question} ?????"
end

cards = %w{Ace King Queen Jack 10 9 8 7 6 5 4 3 2}
suits = %w{Spades Clubs Hearts Diamonds}

DECK = cards.product(suits)

def calculate_total(cards)
  arr = cards.map{|c| c[0]}

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
    total += 10
    else
  total += value.to_i
    end  
  end

  arr.select{|e| e == "Ace"}.count.times do
   total -= 10 if total > 21
  end

  total
end

def blackjack?(p_total, d_total)
  if d_total == 21 && p_total == 21
    say "Push! Dealer and Player have BlackJack!"
  elsif d_total == 21
    say "Dealer has BlackJack Dealer Wins!"
  elsif p_total == 21
    say "You have a BlackJack you Win!"
  else
    "No Black Jack"
  end
end

say "Welcome to Black Jack!"
puts "*" * 45

player_cards = []
dealer_cards = []

play_deck = DECK.shuffle
dealer_cards << play_deck.pop
player_cards << play_deck.pop
dealer_cards << play_deck.pop
player_cards << play_deck.pop

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

say "The dealers first card is #{dealer_cards[0]}"
say "Your cards are #{player_cards}"
puts "Your total is #{player_total}"

if blackjack?(player_total, dealer_total) != "No Black Jack"
  puts "Game over"
  exit
end

while player_total < 21
  ask "Hit or Stand? Enter H for Hit or S for Stand"
  hit_or_stand = gets.chomp.downcase
  if hit_or_stand == "h"
    player_cards << play_deck.pop
    player_total = calculate_total(player_cards)
    
    say "Player hand #{player_cards}"

    puts "Your total is now #{player_total}"

  elsif hit_or_stand == "s"
    puts "You chose to stand"
    break
  end
end

if player_total > 21
  say "You Busted! Sorry you lost"
  exit
end

say "Dealers cards are #{dealer_cards}"

while dealer_total < 17
  say "Dealer chose to hit"
  dealer_cards << play_deck.pop
  say "Dealers hand is #{dealer_cards}"
  dealer_total = calculate_total(dealer_cards)
  puts "The Dealers new total is #{dealer_total}"
end

if dealer_total > 21
  say "Dealer Busts! You Win!"
  exit
end

puts "Your total is #{player_total}"

if dealer_total == player_total
  say "Push! No Winners"
elsif dealer_total > player_total
  say "Dealer Wins!"
else
  say "You Win!"
end













