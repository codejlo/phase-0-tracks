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
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

  private

  ### predicted_deaths ###
  # Based on population_density, we are bucketing a state's density
  # into one of 5 severity buckets, where more population density
  # means a higher rate of death in the population.
  # The output of this method is to print a statement that includes
  # the number of deaths calculated in the function.

  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  ### speed_of_spread ###
  # For a given state, based on population density buckets, this 
  # method determines the speed of spread and prints it in a 
  # statement to the console.

  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

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

