# alias_manager.rb
# Jason Lorentzen

### PSEUDOCODE ###
=begin comment

Letter Type Method:
- Take a letter as an argument
- If vowel, return 'v'
- If consonant, return 'c'
- If not a letter, return nil

Next Vowel Method:
- Take a vowel as an argument
- Return the next vowel in the sequence 'aeiou', wrapping to the beginning for u 

Next Consonant Method:
- Take a consonant as an argument
- Return the next consonant in the alphabet, omitting 'aeiou'

Alias Algorithm:
- Take a word (a name)
- Iterate through each letter in a word
- Remember whether it is capitalized or not, then change to lower case if needed
- For each letter:
	- if it's a vowel, change to the next vowel (next vowel method)
	- if it's a consonant, change to the next consonant (next consonant method)
	- if it's neither, keep it the same
- Recapitalize if it was originally capitalized

Handler:
- Take a string of two names
- Split them into a two element array and reverse their positions
- For both the first name and last name, run the alias algorithm
- Return a string of the name recombined from the results of the alias algorithm

User Interface:
- Ask user for name (first + last)
- Get user input as a string
- Make sure the user entered a string of only a first name and last name
	Inform the user of error if not
- Run the Handler on the string
- Store both the original name and the new alias as a new element in an array
- Give the user the option to repeat
- Print each original name and alias from the session when the user chooses to quit
- End program

=end
### END PSEUDOCODE ###


### Set Global Variables ###

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
alias_array = []

# collect names, run algorithm, store result and repeat as necessary
while run == true

	# prompt for and collect name
	puts "Enter the first and last name for which you'd like an alias,
	separated by a space:"
	user_name = gets.chomp
	spy_alias = ''

	# if the user enters two strings separated by a space, find an alias
	if user_name.split(' ').length == 2
		spy_alias = spy_name_handler(user_name)
		alias_array.push([user_name, spy_alias])
	else
		puts "Your input is not in the format of a first name and last name."
	end

	# determine if the user would like to continue
	puts "Press <Enter> to find another alias, or type 'quit' to stop."
	quit = gets.chomp
	if quit == 'quit' then run = false end


end

# iterate through the name/alias pairs and print result
alias_array.each do |pair_array|
	puts pair_array[0] + " is also known as " + pair_array[1]
end

