# Hamsters.rb
# GPS 4.3 Pairing: Elizabeth Lefever, Jason Lorentzen
# Collect info about a user's hamster and print to console

# Collect user Input

puts "Enter yor hamster's name:"
name = gets.chomp()				# already a string

puts "Enter volume level: (1 to 10)"
volume = gets.chomp().to_i		# convert to integer

puts "Enter fur color:"
fur_color = gets.chomp()		# already a string

puts "A good candidate for adoption: (yes/no)"
adoption = gets.chomp()			# could be a boolean, but string works here

puts "Enter estimated hamster age:"
age = gets.chomp()				# collect input

if age == ""					# test for blank
	age = nil					# set as nil if blank
else
	age = age.to_i				# convert to integer otherwise
end

# Print values entered to the console in readable format
# Ruby interprets line breaks in code as newline for console print

puts "\nMy hamster's name is #{name}.
It's fur is #{fur_color}.
Is it quiet or loud? You tell me. Its volume level is #{volume}.
Is it a good candidate for adoption? #{adoption}.
And its age is #{age}."

# End main program

# Code below used for object type testing

=begin
puts name.class
puts volume.class
puts fur_color.class
puts adoption.class
puts age.class
=end

					