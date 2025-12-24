balance =  1056.254
loop do
puts "Hello, User what do you want."
    puts "Type 1 for Balance Check"
    puts "Type 2 for deposit"
    puts "Type 3 for Withdraw"
    puts "Type 4 for exit"
     choice = gets.to_i
    case choice
       
    when 1
        puts balance
    when 2
        puts "How much money you want to deposit."
        money = gets.to_f
         balance = balance + money
         puts "Rs." + money.to_s + " is deposited in your account. Your new balance is: " + balance.to_s
    when 3
        puts "How much you want to withdraw"
        need = gets.to_f
        if need <= balance
            balance = balance - need 
        puts "Rs." + need.to_s + " is deducted from your balance. Your new balance is: " + balance.to_s
        else
            puts"Insufficient funds!"
        end
    when 4 
        puts "Thank you user." 
        break  
    else
        puts "Invalid choice"
    end
end
