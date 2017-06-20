# All the students are in an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :july},
{name: "Darth Vader", cohort: :july},
{name: "Nurse Ratched", cohort: :july},
{name: "Michael Corleone", cohort: :july},
{name: "Alex DeLarge", cohort: :july},
{name: "The Wicked Witch of the West", cohort: :july},
{name: "Terminator", cohort: :july},
{name: "Freddy Krueger", cohort: :july},
{name: "The Joker", cohort: :july},
{name: "Joffrey Baratheon", cohort: :july},
{name: "Norman Bates", cohort: :july}]

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

print_header
print(students)
print_footer(students)
