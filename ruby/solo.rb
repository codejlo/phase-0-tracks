# 6.4 Solo Challenge
# solo.rb
# Jason Lorentzen

### PSEUDOCODE ###
#
# - Define a class for bicycle
#
# - Attributes
# 		- color (w/accessor)
# 		- size (w/accessor)
# 		- style (w/accessor)
#  		- tire pressure (w/reader)
# 		- electric (t/f) (w/accessor)
#
# - Methods
# 		- inflate_tires
# 			* take desired tire pressure as argument 
# 			* print current tire pressure
# 			* print final new tire pressure
# 		- print_bike
# 			* print all of the current attributes (excl tire pressure) 
# 			  of the bicycle class
# 		- sell_bike
# 			* take a sale price as an argument 
# 			* print an ad for the bike
#


### Class Code ###

class Bicycle

	attr_reader :tire_pressure, :id, :price
	attr_accessor :color, :size, :style, :electric

	def initialize
		@id = rand(999999)
		@color = "black"
		@size = 54
		@style = "cruiser"
		@electric = false
		@tire_pressure = 0
	end

	def inflate_tires(int)
		p 'Current tire pressure: ' + @tire_pressure.to_s
		@tire_pressure = int
		p 'New tire pressure: ' + @tire_pressure.to_s
	end

	def print_bike
		puts 'Bike ID:  ' + @id.to_s
		puts 'Color:    ' + @color
		puts 'Size:     ' + @size.to_s
		puts 'Style:    ' + @style
		puts 'Electric? ' + @electric
		# intentionally not printing tire pressure or price (other methods)
	end

	def sell_bike(price)
		@price = price
		puts 'A great new bike now on sale!'
		puts 'Get this beautiful ' + @color + ' bike'
		puts 'for only $' + price.to_s + '.'
	end

end


### DRIVER CODE / UI ###

bikes_array = []
proceed = nil

until proceed == 'done'
	p 'Press enter to create a bike or done to stop:'
	proceed = gets.chomp

	if proceed != 'done'
		bikes_array << Bicycle.new
		p 'Enter color:'
		bikes_array[-1].color = gets.chomp
		p 'Enter size:'
		bikes_array[-1].size = gets.chomp.to_i
		p 'Enter style:'
		bikes_array[-1].style = gets.chomp
		p 'Make electric? (y/n)'
		bikes_array[-1].electric = gets.chomp
	end

end

bikes_array.each { |bike| bike.print_bike }

# bikes_array[0].sell_bike(499)
# bikes_array[0].inflate_tires(65)




