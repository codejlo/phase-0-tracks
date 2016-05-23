# Determine how many interviewees
puts "How many employees will be processed?"
employees = gets.chomp().to_i

(1..employees).each do |i|

	# initialize result with default value

	result = "Results inconclusive."

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

	# Test for a vampire on first set of questions

	if (age == 2016-year) && (garlic == "y" || insurance == "y")
		result = "Probably not a vampire."
	end

	# Loop over allergies to screen for sunshine
	puts "Please enter any allergies. Press enter after each. Type 'done' when finished"
	allergies = nil
	until allergies == "sunshine" || allergies == "done"
		allergies = gets.chomp()
		if allergies == "sunshine"
			result = "Probably a vampire."
		end
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


	# Print result

	puts result

end
