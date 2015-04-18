# Ruby calculator
puts "***---Welcome to the Ruby Calculator---***"

# Method for text decoration
def say(output)
  puts "===> #{output} <==="
end

say "Use (m) to multiply, (d) to divide, (s) to subtract or (a) to add"

operator = gets.chomp.downcase

say "Please enter the first number"

num1 = gets.chomp

say "Please enter the second number"

num2 = gets.chomp

if operator == 'm'
  result = num1.to_i * num2.to_i
elsif operator == 'd'
  result = num1.to_f / num2.to_f
elsif operator == 's'
  result = num1.to_i - num2.to_i
elsif operator == 'a'
  result = num1.to_i  + num2.to_i
else
  puts "You did not enter a valid operator"
end

say "The result is: #{result}"

