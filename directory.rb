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

puts "The students of Villains Academy"
puts "-------------"
# Print the list of students
students.each do |student|
  puts student
end
# And finally the total number
puts "Overall, we have #{students.count} great students."
