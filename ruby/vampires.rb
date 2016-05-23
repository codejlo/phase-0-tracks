# Asking questions of potential vampire

puts "What is your name"
name = gets.chomp()

puts "How old are you?"
age = gets.chomp().to_i

puts "What year were you born?"
year = gets.chomp().to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic = gets.chomp()

puts "Would you like to enroll in the company’s health insurance? (y/n)"
insurance = gets.chomp()

result = "Results inconclusive."

if (age == 2016-year) && (garlic == "y" || insurance == "y")
	result = "Probably not a vampire."
end

if !(age == 2016-year) && (garlic == "n" || insurance == "n")
	result = "Probably a vampire."
end

if !(age == 2016-year) && garlic == "n" && insurance == "n"
	result = "Almost certainly a vampire."
end

if name == "Drake Cula" || name == "Tu Fang"
	result = "Definitely a vampire."
end

puts result
