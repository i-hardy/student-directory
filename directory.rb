# All the students are in an array
students = [
["Dr. Hannibal Lecter", :july],
["Darth Vader", :july],
["Nurse Ratched", :july],
["Michael Corleone", :july],
["Alex DeLarge", :july],
["The Wicked Witch of the West", :july],
["Terminator", :july],
["Freddy Krueger", :july],
["The Joker", :july],
["Joffrey Baratheon", :july],
["Norman Bates", :july]]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print the list of students
def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
    end
end

# And finally the total number
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

print_header
print(students)
print_footer(students)
