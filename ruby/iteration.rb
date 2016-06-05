# iteration.rb
# Jason Lorentzen , Richie Ito

### Release 0 ###

def test_method
	puts "This is the start of the test method."
	yield("Richie")
	puts "This is the end of the test method."
end

test_method { |name| puts "Your name is " + name + "."}


### Release 1 ###

array_movies = ["Top Gun", "Transformers", "Lego Movie", "Mean Girls"]

hash_actors = {"Tom Cruise" => "Maverick", "Shia LeBuff" => "Transformers Dude", "Morgan Freeman" =>"Oracle", "Lindsey Lohan" => "Nice Girl"}

array_movies.each do |movie|
	puts movie
end

hash_actors.each do |actors,role|
	puts "#{actors}'s best role was #{role}"
end

array_movies.map! do |movie|
	movie+" 2"
end

p array_movies
p hash_actors


### Release 2 ###

# FOR ARRAYS:
# delete_if { |item| block } → ary
# keep_if { |item| block } → ary
# select { |item| block } → new_ary (destructive with !)
# drop_while { |item| block } → array

p method_test_array = ['a','a','a','b','b','b','c','c','c','d','d','d', 'e', 'e', 'e']

p method_test_array.delete_if { |item| item == 'a'}

p method_test_array.keep_if { |item| item == 'b' || item == 'c' || item == 'e'}

p method_test_array.select! { |item| item == 'b' || item == 'c' }

p method_test_array.drop_while { |item| item == 'b'}


# FOR HASHES:
# delete_if {| key, value | block } → hsh
# keep_if {| key, value | block } → hsh
# select {|key, value| block} → a_hash (destructive with !)
# drop_while {|key, value| block} → a_hash

p method_test_hash = {'a'=>1, 'b'=>1, 'c'=>2, 'd'=>2, 'e'=>2, 'f'=>3, 'g'=>3}

p method_test_hash.delete_if { |key, value| value == 1}

p method_test_hash.keep_if { |key, value| value == 2}

p method_test_hash.select! { |key, value| key == 'c' || key == 'd'}

p Hash[method_test_hash.drop_while { |key, value| key == 'c'}]


