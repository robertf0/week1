# Paper, Rock, Scissors

def say(output)
  puts "-----> #{output} <-----"
end

CHOICE = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

say "Welcome to Ruby Paper Rock Scissors"
puts "-" * 50
say "What is your name"
name = gets.chomp.capitalize

loop do 

  begin
    say "Please choose (p) for Paper, (r) for Rock or (s) for Scissors"
    user_pick = gets.chomp.downcase
  end until CHOICE.keys.include?(user_pick)

  say "#{name} chose #{CHOICE[user_pick]}"

  computer_pick = CHOICE.keys.sample

  say "The computer chose #{CHOICE[computer_pick]}"

  sleep 1

  if user_pick == computer_pick
    say "It's a tie!"
  elsif user_pick == 'p' && computer_pick == 'r'
    say "Paper covers Rock" 
    say "#{name} wins!"
  elsif user_pick == 's' && computer_pick == 'p'
    say "Scissors cut Paper"
    say "#{name} wins!"
  elsif user_pick == 'r' && computer_pick == 's'
    say "Rock crushes Scissors" 
    say "#{name} wins!"
  elsif computer_pick == 'p' && user_pick == 'r'
    say "Paper covers Rock"
    say "Computer wins!"
  elsif computer_pick == 's' && user_pick == 'p'
    say "Scissors cut Paper"
    say "Computer wins!"
  elsif computer_pick == 'r' && user_pick == 's'
    say "Rock crushes Scissors"
    say "Computer wins!"
  end  
  
  say "Would you like to play again? (y/n)"
  break if gets.chomp.downcase == "n"

end
