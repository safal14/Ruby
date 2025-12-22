# basic number guessing in Ruby
puts "Guess a number between 1 to 20"
num = gets.to_i

if num >= 1 && num <= 20
  case num
  when 1..5
    puts "Too low! Try again."
  when 6..9
    puts "Near, but low"
  when 10
    puts "Congratulations! You guessed it!"
  when 11..14
    puts "Too high! Try again."
  when 15..20
    puts "Too far"
  end
else
  puts "Invalid number! Enter between 1 and 20."
end
