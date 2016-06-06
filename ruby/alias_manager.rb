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

def letter_type(letter)
	if $vowels.index(letter) != nil
		return 'v'
	elsif $consonants.index(letter) != nil
		return 'c'
	else
		return nil
	end
end

def next_vowel(letter)
	i = $vowels.index(letter)
	if i < 4
		return $vowels[i+1]
	else
		return $vowels[0]
	end
end

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
	
	word.each_char do |letter|
		typing = letter_type(letter)
		if typing == 'v'
			spy_word.concat(next_vowel(letter))
		elsif typing == 'c'
			spy_word.concat(next_consonant(letter))
		else
			spy_word.concat(letter)
		end
	end

	spy_word
end


### Define Implementation ###

def spy_name_handler(real_name)
	spy_name = ''
	real_array = real_name.downcase.split(' ')
	spy_array = []

	real_array.reverse.each do |name|
		spy_array.push(encryptor(name).capitalize)
	end

	spy_name = spy_array.join(' ')
end


### Implementation Test Cases ###

p spy_name_handler("Felicia Torres") 
# ==> "Vussit Gimodoe" *Passed

p spy_name_handler("Jason Lorentzen")
# ==> "Musipvbip Ketup" *Passed

p spy_name_handler("Zazzy Uruuzu")
# ==> "Asaaba Bebbz" *Passed

p spy_name_handler("Wham! Bam?")
# ==> "Cen? Xjen!" *Passed