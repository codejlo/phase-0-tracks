# 6.3 Attributes
# santa.rb
# Jason Lorentzen

class Santa

	attr_reader :age, :ethnicity
	attr_accessor :gender

	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = rand(141)
		puts "Initializing Santa instance..."
	end

	def speak()
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}."
	end

	def celebrate_birthday()
		@age += 1
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.delete(reindeer)
		@reindeer_ranking.push(reindeer)
	end

# Getter + Setter Methods (refactored above)
#
#   def age
#		@age
#   end
#   
#   def ethnicity
#   	@ethnicity
#   end
#   
#   def gender=(gender)
#   	@gender = gender
#   end
#

end


### DRIVER CODE ###

example_genders = ["agender", "female", "bigender", "male", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

10000.times do
	santa = Santa.new(example_genders.sample, example_ethnicities.sample)
	p 'Gender:    ' + santa.gender
	p 'Age:       ' + santa.age.to_s
	p 'Ethnicity: ' + santa.ethnicity
end


# OLD DRIVER CODE #

# santa1 = Santa.new("female", "chinese")
# santa1.speak()
# santa1.eat_milk_and_cookies("oatmeal cookie")

# santas = []
# example_genders = ["agender", "female", "bigender", "male", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# 20.times do
#   santas << Santa.new(example_genders.sample, example_ethnicities.sample)
# end

# santas[0].celebrate_birthday
# santas[0].get_mad_at("Vixen")
# santas[0].gender = "awesome"
# p santas[0].age
# p santas[0].ethnicity
# p santas[0]

