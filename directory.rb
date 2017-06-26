def student_info
  @name = gets.tr("\n", "")
  puts "What is their cohort?"
  @cohort = gets.tr("\n", "")
    if @cohort.empty?
      @cohort = "july"
    end
  puts "What is their favourite animal?"
  @animal = gets.tr("\n","")
  puts "And how tall are they in centimetres?"
  @height = gets.tr("\n","").to_i
end

def input_students
  puts "Please enter a student's name".center(75)
  puts "To finish, just hit return twice".center(75)
  # Create an empty array
  students = []
  # Call the student_info method to get initial input
  student_info
  # While loop to continue prompting for input
  while !@name.empty? do
    # Add hash to the array for each student
    students << {name: @name, cohort: @cohort.downcase.to_sym, animal: @animal, height: @height}
    plural = ("student" if students.count == 1 ) || ("students")
    puts "Now we have #{students.count} #{plural}".center(75)
    # Get another student
    student_info
    break if @name.empty?
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

def print_by_cohort(students)
  sorted = students.sort_by { |student| student[:cohort] }
  sorted.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
