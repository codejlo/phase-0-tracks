# Determine how many interviewees
puts "How many employees will be processed?"
employees = gets.chomp().to_i

(1..employees).each do |i|

	# initialize result with default value

	result = nil

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


	# Test for a vampire on the remainder of questions, in order of specificity
	# Only execute tests if they are necessary

	if (name == "Drake Cula") || (name == "Tu Fang")
		result = "Definitely a vampire."
	elsif (age != 2016-year) && (garlic == "n") && (insurance == "n")
		result = "Almost certainly a vampire."
	elsif (age != 2016-year) && (garlic == "n" || insurance == "n")
		result = "Probably a vampire."
	else
		# Loop over allergies to screen for sunshine; test only relevant if more specific tests fail.
		# Placing the loop here is efficient because it only runs if it is useful
		#(i.e. another more specific or equivalent test already hasnt been run)
		
		puts "Please enter any allergies. Press enter after each. Type 'done' when finished"
		allergies = nil
		until (allergies == "sunshine") || (allergies == "done")
			allergies = gets.chomp()
			if allergies == "sunshine"
				result = "Probably a vampire."
			end
		end
	end

	# If they have not tested positive for being a vampire, then assign result.
	if result == nil
		if (age == 2016-year) && (garlic == "y" || insurance == "y")
			result = "Probably not a vampire."
		else
			result = "Results inconclusive."
		end
	end


	# Print result

	puts result

	puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

end
