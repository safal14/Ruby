def add_item(cart, name, price, qty)
  cart << { name: name, price: price, qty: qty }
  puts "Item added successfully."
end

def remove_item(cart, name)
  item = cart.find { |i| i[:name].downcase == name.downcase }

  if item
    cart.delete(item)
    puts "Item removed successfully."
  else
    puts "Item not found."
  end
end

def total_price(cart)
  cart.inject(0) { |sum, item| sum + (item[:price] * item[:qty]) }
end

def show_cart(cart)
  if cart.empty?
    puts "Cart is empty."
  else
    puts "\n--- Shopping Cart ---"
    cart.each do |item|
      puts "Name: #{item[:name]}, Price: #{item[:price]}, Qty: #{item[:qty]}"
    end
  end
end
cart = []

puts "Welcome to Simple Shopping Cart"

loop do
  puts "\nChoose an option: add | remove | show | total | exit"
  choice = gets.chomp.downcase

  case choice
  when "add"
    puts "Enter item name:"
    name = gets.chomp

    puts "Enter price:"
    price = gets.chomp.to_f

    puts "Enter quantity:"
    qty = gets.chomp.to_i

    add_item(cart, name, price, qty)

  when "remove"
    puts "Enter item name to remove:"
    name = gets.chomp
    remove_item(cart, name)

  when "show"
    show_cart(cart)

  when "total"
    puts "Total Price: #{total_price(cart)}"

  when "exit"
    puts "Thank you for shopping!"
    break

  else
    puts "Invalid option. Try again."
  end
end
