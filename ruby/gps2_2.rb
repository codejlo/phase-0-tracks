# Establish global variable for list

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Use built in slice method to break string into individual array elements
  # Cycle through the array, taking each element as a new hash key and assign default amount
  # (Default quantity is 1)
  # Call print method on the current hash
# output: return the hash

# Method to add an item to a list
# input: item name and optional quantity
# steps:
	# Check if name is in the hash
		# if so, print error message {possible fancy call of quantity update method}
		# if not, add name as key and quantity as value
			#if no quantity given, default value to 1
# output: Update global hash

# Method to remove an item from the list
# input: item name
# steps:
	# check if item is in hash
		# if not, print error
		# if yes, delete item and value
# output: Update global hash

# Method to update the quantity of an item
# input: item name and quantity
# steps:
	# search for hash key using item name
		# if not, add new hash key
	# set quanitity of hash key to input quantity
# output: Update global hash

# Method to print a list and make it look pretty
# input: hash
# steps:
	# iterate over each key-value pair
	# print value + key {fancy option to justify text to equal}
# output: (printed list)

# GPS 2.2 - Ruby 
# June 11, 2016 - Jason and Neill

# Establish global variable for list
$list = Hash.new

# Method to create a list
def list_creator(item_string)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  item_array = []
  # Use built in slice method to break string into individual array elements
  item_array = item_string.split(' ')
  # Cycle through the array, taking each element as a new hash key and assign default amount
  item_array.each {|x| $list[x] = 1}
  # (Default quantity is 1)
  p $list 
  # Call print method on the current hash
# output: return the hash
end

# Method to add an item to a list
# input: item name and optional quantity
def add_item(new_item, quantity)
# steps:
	# Check if name is in the hash

		# if so, print error message {possible fancy call of quantity update method}
		# if not, add name as key and quantity as value
		$list[new_item] = quantity 
			#if no quantity given, default value to 1
# output: Update global hash
end 

# Method to remove an item from the list
def remove_item(item)
# input: item name
# steps:
	# check if item is in hash
		# if not, print error
		# if yes, delete item and value
		$list.delete(item)
# output: Update global hash
end 


# Method to update the quantity of an item
# input: item name and quantity
def update_list(item, quantity)
# steps:
	# search for hash key using item name
		# if not, add new hash key
	# set quanitity of hash key to input quantity
	$list[item] = quantity
# output: Update global hash
end

# Method to print a list and make it look pretty
def print_list(list)
# input: hash
# steps:
	# iterate over each key-value pair
	$list.each{|key, value| p value.to_s + " " + key}
	# print value + key {fancy option to justify text to equal}
# output: (printed list)
end 


# Driver Code
# driver code for first method: 

list_creator("pears bananas apples")

add_item("lemonade", 2)
add_item("tomatoes", 3)
add_item("onions", 1)
add_item("ice cream", 4)

remove_item("lemonade")

update_list("ice cream", 1)

print_list($list)
