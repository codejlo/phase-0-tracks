# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Require relative looks in the current (relative) directory and searches
# for a file with the name in quotes give after. This differs from just 
# 'require' because it looks in the current directory rather than taking
# an absolute path from the root directory.
#
# Primary use is to import information from another file.

require_relative 'state_data'

class VirusPredictor

  ### intialize ###
  # This method initializes three instance variables based on
  # arguments passed to the function. These instance variables are
  # available throughout the class and can be read and modified by
  # instance functions.

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  ### virus_effects ###
  # This method is using other methods to determine the predicted deaths
  # and speed of spread for a given state, and printing that information
  # to the console.

  def virus_effects
    print "#{@state} will lose #{predicted_deaths()} people in this outbreak and will spread across the state in #{speed_of_spread()} months.\n\n"
  end


  private

  ### predicted_deaths ###
  # Based on population_density, we are bucketing a state's density
  # into one of 5 severity buckets, where more population density
  # means a higher rate of death in the population.
  # The output of this method is to print a statement that includes
  # the number of deaths calculated in the function.

  def predicted_deaths
    # predicted deaths is solely based on population density
    factor_hsh = {'200' => 0.4, '150'=> 0.3, '100'=> 0.2, '50'=> 0.1, '0'=> 0.05}
    (@population * factor_hsh[density_type]).floor
  end

  ### speed_of_spread ###
  # For a given state, based on population density buckets, this 
  # method determines the speed of spread and prints it in a 
  # statement to the console.

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed_hsh = {'200' => 0.5, '150'=> 1, '100'=> 1.5, '50'=> 2, '0'=> 2.5}
    speed_hsh[density_type]
  end

  def density_type
    density_ary = ['0','50','100','150','200']
    density = density_ary.pop
    while @population_density < density.to_i && density_ary != nil
      density = density_ary.pop
    end
    density
  end


end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


#alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
#alabama.virus_effects

#jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
#jersey.virus_effects

#california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
#california.virus_effects

#alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
#alaska.virus_effects

STATE_DATA.each do |state, pop_data|
  state_instance = VirusPredictor.new(state, pop_data[:population_density], pop_data[:population])
  state_instance.virus_effects
end

#=======================================================================

# REFLECTION
=begin

What are the differences between the two different hash syntaxes shown in the state_data file?
- string vs. symbol keys: symbols used for data descriptions, str for unique
- => vs : notation, based on the above

What does require_relative do? How is it different from require?
Require_relative is a method that takes a string and returns the information
in another file, using a path relative to the current directory.

What are some ways to iterate through a hash?
#each and #map are useful here. When all you really want to do is create an
interaction, like printing something to the console, .each is great
because there's not modification to the existing array or the returned array.
#map is more for when we want to return an array that has some of the data
manipulated.

When refactoring virus_effects, what stood out to you about the variables, if anything?
Just a ton of repetition within the called functions.

What concept did you most solidify in this challenge?
Understand scope with 'require' and 'private' were really helpful (and new).


=end