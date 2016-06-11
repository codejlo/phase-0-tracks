# GPS 2.2 - Ruby 
# June 11, 2016 - Jason and Neill

### PSEUDOCODE ###

# Establish global variable for list

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Use built in 'split' method to break string into individual array elements
  # Cycle through the array, taking each element as a new hash key and assign default amount
  # (Default quantity is 1)
  # Call print method on the current hash
# output: return the hash

# Method to add an item to a list
# input: item name and optional quantity
# steps:
	# if no quantity given, default value to 1
	# add name as key and quantity as value
# output: (Update global hash)

# Method to remove an item from the list
# input: item name
# steps:
	# delete item and value
# output: (Update global hash)

# Method to update the quantity of an item
# input: item name and quantity
# steps:
	# set quanitity of hash key to given quantity
# output: (Update global hash)

# Method to print a list and make it look pretty
# input: hash
# steps:
	# iterate over each key-value pair
	# print value + key at each key-value pair, one pair per line
# output: (printed list)


### GLOBAL DEFINITIONS ###

$list = Hash.new


### METHODS ###

def list_creator(item_string)
  item_array = []
  item_array = item_string.split(' ')
  item_array.each {|x| $list[x] = 1}
  puts 'New list created:'
  print_list($list)
end


def add_item(new_item, quantity)
	if quantity == nil
		quantity = 1
	end

	$list[new_item] = quantity 
end 


def remove_item(item)
	$list.delete(item)
end 


def update_list(item, quantity)
	$list[item] = quantity
end


def print_list(list)
	puts 'Current list is:'
	$list.each{|key, value| p value.to_s + ' ' + key}
end 


### DRIVER CODE ###

list_creator("pears bananas apples")

add_item("lemonade", 2)
add_item("tomatoes", 3)
add_item("onions", 1)
add_item("ice cream", 4)

remove_item("lemonade")

update_list("ice cream", 1)

print_list($list)


### REFLECTION ###

# What did you learn about pseudocode from working on this challenge?
# It feels like pseudocode can really be the meat of a coding challenge
# if you really work through it solidly. After pseudocoding, we were able
# to quickly identify needed operations and built-in methods to complete
# our code with few errors.

# What are the tradeoffs of using arrays and hashes for this challenge?
# I feel like the main reason that hashes worked well for this challenge
# that we needed to identify and access the list by item name. With a
# nested array, we would have needed to do a lot of iteration through
# elements to search for and find the right item to modify. With a hash,
# the name is the native search method, making our functions in this 
# challenge more intutitive to implement.

# What does a method return?
# A method returns the result of the last line of code that you give it,
# or whatever explicitly follows a 'return'. Sometimes, in our code, we
# changed global variables as a method side effect rather than using
# a return value.

# What kind of things can you pass into methods as arguments?
# You can pass any variable type into a method; however, your method
# may only be able to handle certain data types to complete its task.
# While we didn't here, a possible upgrade to our code would have been
# to create code that validates function arguments before conducting
# the needed operation.

# How can you pass information between methods?
# You can pass the information you want to modify into the method as
# and argument (in this case, a hash), and then return the resulting
# modified variable. Or, you can declare a global variable accessible
# by the methods.

# What concepts were solidified in this challenge, and what concepts are still confusing?
# I think it helped to clarify the interactions of methods, but it
# will still take a bunch of practice to really nail common built-in
# methods.
