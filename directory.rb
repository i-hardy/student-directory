@students = []

def print_menu
  puts "Please select from the following options:".center(75)
  puts "1. Input students".center(75)
  puts "2. Show the students".center(75)
  puts "3. Save the list of students to a file".center(75)
  puts "4. Load the list of students from a file".center(75)
  puts "9. Exit".center(75)
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      # Input the students
      students = input_students
    when "2"
      # Show the students
      show_students
    when "3"
      save_students
    when "4"
      puts "What file do you want to load?"
      filename = STDIN.gets.chomp
      load_students(filename)
    when "9"
      # Terminate the program
      exit
    else
      puts "I don't know what you meant, please try again\n"
  end
end

def save_students
  puts "Please choose a filename"
  filename = STDIN.gets.chomp
  # Open the file for writing
  file = File.open("#{filename}.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:animal], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File successfully saved".center(75)
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort, @animal, @height = line.chomp.split(",")
    create_students_array
  end
  file.close
  puts "File successfully opened".center(75)
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(75)
  else
    puts "Sorry, #{filename} doesn't exist".center(75)
    exit
  end
end

def interactive_menu
  loop do
    # Print the menu and ask the user what to do
    print_menu
    # Do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def student_info
  @name = STDIN.gets.tr("\n", "")
  if !@name.empty?
    puts "What is their cohort?"
    @cohort = STDIN.gets.tr("\n", "")
      if @cohort.empty?
        @cohort = "july"
      end
    puts "What is their favourite animal?"
    @animal = STDIN.gets.tr("\n","")
    puts "And how tall are they in centimetres?"
    @height = STDIN.gets.tr("\n","").to_i
  end
end

def create_students_array
  @students << {name: @name, cohort: @cohort.downcase.to_sym, animal: @animal, height: @height}
end

def plural_or_singular
  @plural = ("student" if @students.count == 1) || ("students")
end

def input_students
  puts "Please enter a student's name".center(75)
  puts "To finish, just hit return twice".center(75)
  # Call the student_info method to get initial input
  student_info
  # While loop to continue prompting for input
  while !@name.empty? do
    # Add hash to the array for each student
    create_students_array
    plural_or_singular
    puts "Now we have #{@students.count} #{@plural}".center(75)
    # Get another student
    student_info
  end
  #Return the array
  @students
end

def print_header
  if @students.count > 0
    puts "The students of Villains Academy".center(75)
    puts "-------------".center(75)
  end
end

# Print the list of students
def print_students_list
  count = 0
  while @students.length > count
    puts "#{count+1}. #{@students[count][:name]} (#{@students[count][:cohort]} cohort)".center(75)
    count += 1
  end
end

# And finally the total number
def print_footer
  plural_or_singular
  if @students.count > 0
    puts "Overall, we have #{@students.count} great #{@plural}.\n".center(75)
  end
end

def select_by_letter(letter)
  @students.each_with_index do |student, index|
    if @student[:name][0] == letter
      puts "#{index+1}. #{@student[:name]} (#{@student[:cohort]} cohort)".center(75)
    end
  end
end

def select_by_length(length)
  @students.each_with_index do |student, index|
    if student[:name].length < length
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
    end
  end
end

def print_by_cohort
  sorted = @students.sort_by { |student| student[:cohort] }
  sorted.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

try_load_students
interactive_menu
