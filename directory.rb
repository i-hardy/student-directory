def input_students
  puts "Please enter a student's name".center(75)
  puts "To finish, just hit return twice".center(75)
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # Ask for the cohort
  puts "And what is their cohort?"
  cohort = gets.chomp
    if cohort.empty?
      cohort = "july"
    end
  # While loop to continue prompting for input
  while !name.empty? do
    # Add hash to the array for each student
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students".center(75)
    # Get another name
    name = gets.chomp
    # And another cohort
    if !name.empty?
      puts "And what is their cohort?"
      cohort = gets.chomp
      if cohort.empty?
        cohort = "july"
      end
    end
  end
  #Return the array
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end

# Print the list of students
def print(students)
  count = 0
  while students.length > count
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)".center(75)
    count += 1
  end
end

# And finally the total number
def print_footer(students)
  puts "Overall, we have #{students.count} great students.".center(75)
end

def select_by_letter(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0] == letter
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
    end
  end
end

def select_by_length(students, length)
  students.each_with_index do |student, index|
    if student[:name].length < length
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
    end
  end
end

students = input_students
print_header
print(students)
print_footer(students)
