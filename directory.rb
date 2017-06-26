require "csv"
@students = []

def center_puts(string)
  puts string.center(75)
end

def print_menu
  center_puts "Please select from the following options:"
  center_puts "1. Input students"
  center_puts "2. Show the students"
  center_puts "3. Save the list of students to a file"
  center_puts "4. Load the list of students from a file"
  center_puts "5. Display students whose name begins with a given letter"
  center_puts "6. Display students whose name is up to a given length"
  center_puts "7. Display students sorted by cohort"
  center_puts "8. Delete an existing file"
  center_puts "9. Exit"
end

def show_students( printmethod, *param)
  print_header
  printmethod.call(param)
  print_footer
end

def process(selection)
  case selection
    when "1"
      # Input the students
      students = input_students
    when "2"
      # Show the students
      show_students(method (:print_students_list))
    when "3"
      save_students
    when "4"
      center_puts "What file do you want to load?"
      filename = STDIN.gets.chomp
      load_students(filename)
    when "5"
      center_puts "What letter do you want to select for?"
      show_students( method(:select_by_letter), gets.chomp)
    when "6"
      center_puts "What length of name do you want to select for?"
      show_students(method (:select_by_length), gets.chomp.to_i)
    when "7"
      show_students(method (:print_by_cohort))
    when "8"
      delete_file
    when "9"
      # Terminate the program
      exit
    else
      center_puts "I don't know what you meant, please try again\n"
  end
end

def save_students
  center_puts "Please choose a filename"
  filename = STDIN.gets.chomp
  # Open the file for writing
  CSV.open("#{filename}.csv", "w") do |csv|
    @students.each do |student|
      csv <<[student[:name], student[:cohort], student[:animal], student[:height]]
    end
  end
  center_puts "File successfully saved\n"
end

def load_students(filename)
  if File.exists?(filename)
    CSV.foreach(filename, "r") do |line|
      @name, @cohort, @animal, @height = line
    create_students_array
    end
    center_puts "File successfully opened\n"
  else
    center_puts "Sorry, #{filename} doesn't exist"
  end
end

def try_load_students
  filename = ARGV.first || "students.csv"
  if File.exists?(filename)
    load_students(filename)
    center_puts "Loaded #{@students.count} from #{filename}"
  else
    center_puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def delete_file
  center_puts "Please state the file you want to delete"
  filename = gets.chomp
  if File.exists?(filename)
    center_puts "Are you sure?"
      if gets.chomp.downcase == "yes"
        File.delete(filename)
      end
  else
    center_puts "That file does not exist\n"
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
    center_puts "What is their cohort?"
    @cohort = STDIN.gets.tr("\n", "")
      if @cohort.empty?
        @cohort = "july"
      end
    center_puts "What is their favourite animal?"
    @animal = STDIN.gets.tr("\n","")
    center_puts "And how tall are they in centimetres?"
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
  center_puts "Please enter a student's name"
  center_puts "To finish, just hit return twice"
  # Call the student_info method to get initial input
  student_info
  # While loop to continue prompting for input
  while !@name.empty? do
    # Add hash to the array for each student
    create_students_array
    plural_or_singular
    center_puts "Now we have #{@students.count} #{@plural}"
    # Get another student
    student_info
  end
  #Return the array
  @students
end

def print_header
  if @students.count > 0
    center_puts "The students of Villains Academy"
    center_puts "-------------"
  end
end

# Print the list of students
def print_students_list(*)
  count = 0
  while @students.length > count
    center_puts "#{count+1}. #{@students[count][:name]} (#{@students[count][:cohort]} cohort)"
    count += 1
  end
end

# And finally the total number
def print_footer
  plural_or_singular
  if @students.count > 0
    center_puts "Overall, we have #{@students.count} great #{@plural}.\n"
  end
end

def select_by_letter(letter)
  @students.each_with_index do |student, index|
    if student[:name][0].downcase == letter.downcase
      center_puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def select_by_length(length)
  @students.each_with_index do |student, index|
    if student[:name].length < length
      center_puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_by_cohort(*)
  sorted = @students.sort_by { |student| student[:cohort] }
  sorted.each_with_index do |student, index|
    center_puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

try_load_students
interactive_menu
