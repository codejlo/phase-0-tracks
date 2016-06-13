#module Shout
#
#	def self.yell_angrily(words)
#    	words + "!!!" + " :("
#  	end
#
#  	def self.yell_happily(words)
#    	words + "!!!" + " :)"
#  	end
#
#end
#
#
#puts Shout.yell_angrily('AHHHHH')
#puts Shout.yell_happily('WEEEEE')

module Shout

	def yell_angrily(words)
    	words + "!!!" + " :("
  	end

  	def yell_happily(words)
    	words + "!!!" + " :)"
  	end

end


class Reality_tv_judge
	include Shout
end


class Basketball_coach
	include Shout
end


black_vee_neck = Reality_tv_judge.new
puts black_vee_neck.yell_angrily("That was the worst thing I have ever heard")
puts black_vee_neck.yell_happily("I am astounded")

coach_k = Basketball_coach.new
puts coach_k.yell_angrily("Are you blind?")
puts coach_k.yell_happily("Nice pass")
