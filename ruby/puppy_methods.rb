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

end



fido = Puppy.new()

fido.fetch("ball")
fido.speak(5)
fido.roll_over()
p fido.dog_years(10)
fido.supper_time(["beef","kibbles","cat"])