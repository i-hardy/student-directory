# All the students are in an array
students = ["Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print the list of students
def print(names)
  names.each do |student|
    puts student
    end
end

# And finally the total number
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print(students)
print_footer(students)
