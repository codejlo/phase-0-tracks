# alias_manager.rb
# Jason Lorentzen

### PSEUDOCODE ###
=begin comment

Next Vowel Method:
- Take a vowel as an argument
- Return the next vowel in the sequence 'aeiou', wrapping to the beginning for u 

Next Consonant Method:
- Take a consonant as an argument
- Return the next consonant in the alphabet, omitting 'aeiou'

Letter Type Method:
- Take a letter as an argument
- If vowel, return 'v'
- If consonant, return 'c'
- If not a letter, return nil

- Ask user for name (first + last)
- Get user input as a string, and downcase the string
- Create an array from the string, with the first and last name as separate elements
- Reverse the order of the array elements
- 

=end
### END PSEUDOCODE ###

### Set Global Variables ###

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
$vowels = 'aeiou'
$consonants = 'bcdfghjklmnpqrstvwxyz'


### Define Helper Functions ###

# determine whether the character is a vowel, consonant or neither
def letter_type(letter)
	if $vowels.index(letter) != nil
		return 'v'
	elsif $consonants.index(letter) != nil
		return 'c'
	else
		return nil	# do nothing to non-letter characters
	end
end

# take the current vowel and return the next vowel in the alphabet
def next_vowel(letter)
	i = $vowels.index(letter)
	if i < 4
		return $vowels[i+1]
	else
		return $vowels[0]
	end
end

# take the current consonant and return the next consonant in the alphabet
def next_consonant(letter)
	i = $consonants.index(letter)
	if i < 20
		return $consonants[i+1]
	else
		return $consonants[0]
	end
end


### Define Algorithm ###

def encryptor(word)
	spy_word = ''
	
	# cycle through letters in the word
	word.each_char do |letter|

		# handle letter cases individually to allow for more than first char capitalization
		upcaser = false
		if letter != letter.downcase then upcaser = true end
		letter = letter.downcase

		# determine if the character is a vowel, consonant or neither
		typing = letter_type(letter)

		# encrypt the letter as applicable
		if typing == 'v'
			spy_word.concat(next_vowel(letter))
		elsif typing == 'c'
			spy_word.concat(next_consonant(letter))
		else
			spy_word.concat(letter)
		end

		#capitalize the current letter if it was originally passed as a capital letter
		if upcaser then spy_word[-1] = spy_word[-1].upcase end
	end

	spy_word
end


### Define Implementation ###

def spy_name_handler(real_name)
	spy_name = ''
	real_array = real_name.split(' ')
	spy_array = []

	real_array.reverse.each do |name|
		spy_array.push(encryptor(name))
	end

	spy_name = spy_array.join(' ')
end

# Test Cases:

# p spy_name_handler("Felicia Torres") 
# ==> "Vussit Gimodoe" *Passed*

# p spy_name_handler("Jason Lorentzen")
# ==> "Musipvbip Ketup" *Passed*

# p spy_name_handler("Zazzy Uruuzu")
# ==> "Asaaba Bebbz" *Passed*

# p spy_name_handler("Wham! Bam?")
# ==> "Cen? Xjen!" *Passed*

# p spy_name_handler("Susan O'Reilly")
# ==> "U'Siommz Tatep" *Passed*


### Implement UI ###

run = true

while run == true

	# prompt for and collect name
	puts "Enter the first and last name for which you'd like an alias,
	separated by a space:"
	user_name = gets.chomp
	spy_alias = ''

	# if the user enters two strings separated by a space, find an alias
	if user_name.split(' ').length == 2
		spy_alias = spy_name_handler(user_name)
		puts "#{user_name} is also known as #{spy_alias}"
	else
		puts "Your input is not in the format of a first name and last name."
	end

	# determine if the user would like to continue
	puts "Press <Enter> to find another alias, or type 'quit' to stop."
	quit = gets.chomp
	if quit == 'quit' then run = false end

end


