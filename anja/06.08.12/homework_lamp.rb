
class Person
	def initialize(name)
		@name = name
		Rooms = ["kitchen", "floor", "bathroom", "dinning room"]

	end

	def move
		person = Room.new
		person.enter_room(Room.shuffle)		#moves into rooms and turns the light on
	end
end

class Room
	def initialize(name)
		@name = name
		@lamp = Lamp.new
	end

	def enter_room
		puts @name + "goes into the " + @name
	end

end

class Lamp
	def initialize()
		@bulb = Bulb.new
		@switch = Switch.new
	end
end

class Switch
	def initialize(state)
		@switch_state = state	#on or off (true or false)	
	end

	def flip
		@switch_state = not @state
	end
end

class Bulb
	def initialize()
		@bulb_state #broken or not broken
	end

	def broken
		puts 
	end 
end	
	


