### START OF PROGRAM ###

=begin
##########
4.6 Mandatory Pairing: More Methods
Youna Yang
Jason Lorentzen

##########
RELEASE 2+3: Pseudocode, methods and tests

ENCRYPT method
--------------

- Accept a input string as an argument when the method is called
- For each index in the string:
  - if the index not a letter:
    - do nothing to that index
  - if the index is a "z":
    - change the letter to an a (wrap around to the front of the alphabet)
  - otherwise:
    - change the index to the next letter in the alphabet
- Return the modified string


##########
=end

# we'll use the alphabet in both methods; declare global variable
$alphabet = "abcdefghijklmnopqrstuvwxyz"

def encrypt(my_string)
  i = 0
  new_string = ""
      # chose to create a new string to return rather than modify the input
      # string by side effect
  
  until i == my_string.length
    if $alphabet.index(my_string[i]) == nil
      new_string += my_string[i]
    elsif $alphabet.index(my_string[i]) == 25
      new_string += "a"
    else
      new_string += my_string[i].next
    end
    i = i + 1
  end
  
  return new_string
end

#### Test cases ###
#puts encrypt("abc")
#puts encrypt("zed")
#puts encrypt("zed abc")

=begin
##########
DECRYPT method
--------------
- Accept a input string as an argument when the method is called
- For each index in the string:
  - if the index not a letter:
    - do nothing to that index
  - if the index is an "a":
    - change the letter to an z (wrap around to the front of the alphabet)
    - since a is 0 and z is -1 in $alphabet, we don't need an extra condition
  - otherwise:
    - change the index to the previous letter in the alphabet
- Return the modified string

##########
=end


def decrypt(my_string)
  i = 0
  new_string = ""
      # chose to create a new string to return rather than modify the input
      # string by side effect
  
  until i == my_string.length
    if $alphabet.index(my_string[i]) == nil
      new_string += my_string[i]
    else
      new_string += $alphabet[$alphabet.index(my_string[i])-1]
      #wraps automatically from 0 to -1; don't need 3rd condition
    end
    i = i + 1
  end
  
  return new_string
end

### Test cases ###
#puts decrypt("bcd")
#puts decrypt("afe")
#puts decrypt("afe bcd")


### RELEASE 4: Nested Method Call ###

#puts decrypt(encrypt("swordfish"))

# This nested call method works because the methods are executed
# sequentially, so the program finds the result of the encrypt
# method and passes that string to the decrypt method. Since the
# methods perform opposite operations, we return the same string
# we entered after both operations are performed.



=begin
##########
RELEASE 5: Upgrading the interface

INTERFACE UPGRADE
-----------------
- Ask the user whether they want to encrypt or decrypt
- Get user answer
- If the user inputs "encrypt" or "decrypt":
  - Ask user for the password
  - Get user password
  - Call method selected by the user on the password
- Otherwise:
  - Ask them to enter a valid preference and return to step 2
- Print the result of the selected method

##########
=end

result = nil

while result == nil
  puts "Do you want to encrypt or decrypt? (encrypt/decrypt)"
  pref = gets.chomp()
  if pref == "encrypt"
    puts "Enter your password: "
    password = gets.chomp()
    result = encrypt(password)
  elsif pref == "decrypt"
    puts "Enter your password: "
    password = gets.chomp()
    result = decrypt(password)
  else
    puts "Please enter [encrypt] or [decrypt]."
  end
end

puts "You entered [#{password}] as your password."
puts "Your #{pref}ed password is [#{result}]."


### END OF PROGRAM ###


















