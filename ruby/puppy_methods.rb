# puppy_methods.rb
# Sarah Sucha
# Jason Lorentzen

class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
  	int.times { puts "Woof!"}
  end

  def roll_over()
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	human_years * 7
  end

  def supper_time(food_array)
  	food_array.each { |item| puts "Now i'm eating #{item}."}
  end

  def initialize()
  	puts "initializing new puppy instance..."
  end

end


class Wolf_eating_rabbits

	def initialize(item)
		puts "Rabbit "+item.to_s
	end

	def eat_wolf(weight)
		puts "I just ate a #{weight} pound wolf!"
	end

	def licking_lips(int)
		int.times {puts "Yum."}
	end

end


fido = Puppy.new()
fido.fetch("ball")
fido.speak(5)
fido.roll_over()
p fido.dog_years(10)
fido.supper_time(["beef","kibbles","cat"])

rabbit_array = []
50.times { |index| rabbit_array.push(Wolf_eating_rabbits.new(index))}
rabbit_array.each { |item| item.eat_wolf(60); item.licking_lips(5)}
