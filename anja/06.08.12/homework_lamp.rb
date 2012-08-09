
class Person
	def initialize(name)
		@name = name
	end

	def moving
		#moves into rooms and turns the light on
	end
end

class Room
	def initialize(name)
		@name = name
		@lamp = Lamp.new
	end
end

class Lamp
	def initialize()
		@bulb = Bulb.new
		@Switch = Switch.new
	end
end

class Switch
	def initialize(state)
		@switch_state	'on or off (true or false)'	
	end

	def flip

	end
end

class Bulb
	def initialize()
		@bulb_state 'broken or not broken'	
	end

	def broken

	end 
end	
	


