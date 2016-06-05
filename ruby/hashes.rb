# hashes.rb
# Jason Lorentzen

### Pseudocode ###
#
# - Initialize an empty hash to collect designer data
#
# - For each desired piece of client information, ask 
# 	the user for input and save to the hash. Convert
# 	data to the appropriate type.
# 	+	:client_name
# 	+	:client_age
# 	+	:num_children
# 	+	:decor_theme
# 	+	:likes_bauhaus
# 	+	:dances_in_cleats
#
# - Print the hash to the screen
#
# - Ask the user if they'd like to update a key
# 	+ Get input for key and value
# 	+ Convert key to symbol
# 	+ Update value for desired key, converting to proper data type
#
# - Print updated hash
#
# - Exit
#
### End Pseudocode ###

# Initializing data structure
client_data = {}

# Collecting user input and converting data types
puts "Enter client name:"
client_data[:client_name] = gets.chomp

puts "Enter client age:"
client_data[:client_age] = gets.chomp.to_i

puts "Enter number of client's children"
client_data[:num_children] = gets.chomp.to_i

puts "Enter client's preferred decor theme:"
client_data[:decor_theme] = gets.chomp

puts "Does the client like the bauhaus movement? (y/n)"
bauhaus = gets.chomp
if bauhaus == "y"
	client_data[:likes_bauhaus] = true
else
	client_data[:likes_bauhaus] = false
end

puts "Does the client like to dance indoors in metal football cleats? (y/n)"
cleats = gets.chomp
if cleats == "y"
	client_data[:dances_in_cleats] = true
else
	client_data[:dances_in_cleats] = false
end

# Printing hash
p client_data

# Collecting desired update and printing if updated
puts "Would you like to update any data? (y/n)"

if gets.chomp == "y"
	
	puts "Which piece of info would you like to update?"
	updater_key = gets.chomp.to_sym
	
	puts "What's the new value?"
	updater_value = gets.chomp
	
	if updater_key == :client_age || updater_key == :num_children
		updater_value.to_i
	elsif updater_key == :likes_bauhaus || updater_key == :dances_in_cleats
		if updater_value == "y"
			updater_value = true
		else
			updater_value = false
		end
	end

	client_data[updater_key] = updater_value

	p client_data
end



		
