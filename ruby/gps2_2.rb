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