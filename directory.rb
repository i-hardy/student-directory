def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While loop to continue prompting for input
  while !name.empty? do
    # Add hash to the array for each student
    students << {name: name, cohort: :july}
    puts "Now we have #{students.count} students"
    # Get another name
    name = gets.chomp
    end
  #Return the array
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print the list of students
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

# And finally the total number
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
