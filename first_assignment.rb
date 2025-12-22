# # basic number guessing in Ruby
# loop do
# puts "Guess a number between 1 to 20"
# num = gets.to_i

# if num >= 1 && num <= 20
#   case num
#   when 1..5
#     puts "Too low! Try again."
#   when 6..9
#     puts "Near, but low"
#   when 10
#     puts "Congratulations! You guessed it!"
#     break
#   when 11..14
#     puts "Too high! Try again."
#   when 15..20
#     puts "Too far"
#   end
# else
#   puts "Invalid number! Enter between 1 and 20."
# end
# end


# using rand
random_number = rand(1..20)
loop do
puts "Guess a number between 1 to 20"
number = gets.to_i

if number == random_number
  puts "Congratulations! You guessed it!"
  break
  elsif number < random_number
    puts "low try again"
  elsif number > random_number
    puts "high try again"
  else
    puts "Invalid number! Enter between 1 and 20."
  end
end
