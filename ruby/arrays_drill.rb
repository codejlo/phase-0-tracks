# arrays_drill.rb
# Jason Lorentzen, Brett Buller


### Release 2-1 and 2-2 ###

def build_array(a, b, c)
	x = []
	return x.push(a, b, c)
end

def add_to_array(my_new_array, a)
	my_new_array.push(a)
end


### Release 1-1 to 1-8 ###

yosemite = []

yosemite.push("half dome", "sequoia", "tent", 17, "San Francisco")

p yosemite

yosemite.delete_at(2)
p yosemite

yosemite.insert(2, "waterfall")
p yosemite

yosemite.shift
p yosemite

yosemite.include?("sequoia")

if yosemite.include?("sequoia") == true
	puts "Yosemite includes the element 'sequoia'."
else puts "Yosemite does not include the element 'sequioa'."
end

dachshund = ["chase", "pumpkin", "toolongtocare"]

combined_array = yosemite + dachshund

p combined_array 


### Release 2-1 and 2-2 continued ###

p build_array(1, "two", nil)
p add_to_array([], "a")
p add_to_array(["a", "b", "c", 1, 2], 3)