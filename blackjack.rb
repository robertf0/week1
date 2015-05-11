cards = %w{Ace King Queen Jack 10 9 8 7 6 5 4 3 2}
suits = %w{Spades Clubs Hearts Diamonds}
DECK = cards.product(suits)

def say(statement)
  puts "<<<<< #{statement} >>>>>"
end

def ask(question)
  puts "????? #{question} ?????"
end

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

def print_dealers_hand(dealer_cards, dealer_total)
  say "Dealers cards are #{dealer_cards}"
  puts "Dealers total is #{dealer_total}"
end

def print_players_hand(player_cards, player_total)
  say "Your cards are #{player_cards}"
  puts "Your total is #{player_total}"
end

def blackjack?(player_total, dealer_total, dealer_cards)
  if dealer_total == 21 && player_total == 21
    print_dealers_hand(dealer_cards, dealer_total)
    say "Push! Dealer and Player have BlackJack!"
    exit
  elsif dealer_total == 21
    print_dealers_hand(dealer_cards, dealer_total)
    say "Dealer has BlackJack Dealer Wins!"
    exit
  elsif player_total == 21
    print_dealers_hand(dealer_cards, dealer_total)
    say "You have a BlackJack you Win!"
    exit
  else
    "No Black Jack"
  end
end

def busted?(player_total, dealer_total, dealer_cards)
  if player_total > 21
    say "You Busted! Sorry you lost"
    print_dealers_hand(dealer_cards, dealer_total)
    exit
  elsif dealer_total > 21
    say "Dealer Busted! You Win!"
    print_dealers_hand(dealer_cards, dealer_total)
    exit
  end
end

def check_winner(player_total, dealer_total)
  if dealer_total == player_total
    say "Push! No Winners"
  elsif dealer_total > player_total
    say "Dealer Wins!"
  else
    say "You Win!"
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
print_players_hand(player_cards, player_total)

blackjack?(player_total, dealer_total, dealer_cards)

while player_total < 21
  ask "Hit or Stand? Enter H for Hit or S for Stand"
  hit_or_stand = gets.chomp.downcase
  if hit_or_stand == "h"
    player_cards << play_deck.pop
    player_total = calculate_total(player_cards)
    print_players_hand(player_cards, player_total)
    busted?(player_total, dealer_total, dealer_cards)
  elsif hit_or_stand == "s"
    puts "You chose to stand"
    break
  end
end

while dealer_total < 17
  print_dealers_hand(dealer_cards, dealer_total)
  say "Dealer chose to hit"
  dealer_cards << play_deck.pop
  say "Dealers hand is #{dealer_cards}"
  dealer_total = calculate_total(dealer_cards)
  puts "The Dealers new total is #{dealer_total}"
  busted?(player_total, dealer_total, dealer_cards)
end

print_dealers_hand(dealer_cards, dealer_total)
print_players_hand(player_cards, player_total)
check_winner(player_total, dealer_total)
