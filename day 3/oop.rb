class Book
  attr_accessor :title, :author, :isbn, :is_available

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @is_available = true
  end

  def check_out
    @is_available = false
  end

  def return_book
    @is_available = true
  end

  def to_s
    status = is_available ? "Available" : "Borrowed"
    "Title: #{@title}, Author: #{@author}, ISBN: #{@isbn}, Status: #{status}"
  end
end
class Member
  attr_accessor :name, :member_id

  @@total_members = 0   # class variable

  def initialize(name, member_id)
    @name = name
    @member_id = member_id
    @borrowed_books = []   # private collection
    @@total_members += 1
  end

  def borrow(book)
    if @borrowed_books.length >= 3
      puts "#{name} cannot borrow more than 3 books."
    elsif !book.is_available
      puts "#{book.title} is not available."
    else
      book.check_out
      @borrowed_books << book
      puts "#{name} borrowed '#{book.title}'."
    end
  end

  def return(book)
    if @borrowed_books.include?(book)
      book.return_book
      @borrowed_books.delete(book)
      puts "#{name} returned '#{book.title}'."
    else
      puts "#{name} did not borrow '#{book.title}'."
    end
  end

  def list_books
    if @borrowed_books.empty?
      puts "#{name} has not borrowed any books."
    else
      puts "#{name}'s borrowed books:"
      @borrowed_books.each { |book| puts "  - #{book.title}" }
    end
  end

  def self.total_members
    @@total_members
  end

  private
  attr_reader :borrowed_books
end
class PremiumMember < Member
  def borrow(book)
    if @borrowed_books.length >= 5
      puts "#{name} (Premium) cannot borrow more than 5 books."
    elsif !book.is_available
      puts "#{book.title} is not available."
    else
      book.check_out
      @borrowed_books << book
      puts "#{name} (Premium) borrowed '#{book.title}'."
    end
  end
end
# Create books
book1 = Book.new("Ruby Basics", "Matz", "ISBN001")
book2 = Book.new("OOP Concepts", "Grady Booch", "ISBN002")
book3 = Book.new("Clean Code", "Robert C. Martin", "ISBN003")
book4 = Book.new("Design Patterns", "GoF", "ISBN004")
book5 = Book.new("Algorithms", "CLRS", "ISBN005")

# Create members
member1 = Member.new("Ram", 101)
member2 = Member.new("Sita", 102)
member3 = Member.new("Hari", 103)
member4 = Member.new("Gita", 104)
premium = PremiumMember.new("Shyam", 201)

# Borrowing books
member1.borrow(book1)
member1.borrow(book2)
member1.borrow(book3)
member1.borrow(book4)   # should fail (limit)

premium.borrow(book4)
premium.borrow(book5)

# Returning a book
member1.return(book2)

# List borrowed books
puts
member1.list_books
premium.list_books

# Total members
puts
puts "Total members created: #{Member.total_members}"
