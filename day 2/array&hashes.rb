# Array of hashes for student basic info
students = [
  { roll: 1, name: "Ram", age: 20 },
  { roll: 2, name: "Sita", age: 21 },
  { roll: 3, name: "Hari", age: 22 }
]
# Hash for marks (keyed by roll number)
marks = {
  1 => { Math: 80, Science: 75, English: 85 },
  2 => { Math: 90, Science: 88, English: 92 },
  3 => { Math: 70, Science: 65, English: 72 }
}
puts "Welcome to Student Information System"
puts "Enter student's name:"
input_name = gets.chomp.downcase
found = false
students.each do |student|
  if student[:name].downcase == input_name
    found = true
    roll = student[:roll]
    student_marks = marks[roll]
    puts "\nStudent Details"
    puts "Name: #{student[:name]}"
    puts "Age: #{student[:age]}"
    puts "Marks:"
    total = 0
    student_marks.each do |subject, mark|
      puts "#{subject}: #{mark}"
      total += mark
    end
    average = total.to_f / student_marks.length
    puts "Total Marks: #{total}"
    puts "Average Marks: #{average.round(2)}"
    break
  end
end
unless found
  puts "Student not found."
end
