
class Person
	def initialize(name)
		@name = name
		@room = Room.names.shuffle!.pop
		@lamp = Lamp.new
	end

	def enter_room
		puts @name + " goes into the " + @room + "."
		puts "Its dark. " + @name +" turns the light on."
		@lamp.flip_switch 
	end
end

class Room
	def self.names
		["kitchen", "floor" , "bathroom" , "dinning room"]
	end
end

class Lamp
 	def initialize()
 		@bulb = Bulb.new()
 		@switch = Switch.new(false)
 	end

 	def flip_switch
		if @bulb.on_or_off == true
 			puts "The light in the #{Person.room} is on."
 			Switch.flip
 		else
			puts "The light in the #{Person.room} was already on. You turned it off."
 			Switch.flip
 		end
 	end
 end

class Switch
 	def initialize(state)
 		@state = state					#true or false	
 	end

 	def flip
 		if @state == true
 			return false
 		else
 			return true
 		end
 		# @state = not @state
 	end
 end

 class Bulb
 	def initialize()
 	 	# @state = true				#on, off or broken
 	end

 	def on_or_off
 		if Switch.flip == true
 			return true
 			#puts "The Bulb is on"
 		else
 			return false
 			# puts "The Bulb is off"
 		end
 	end

 end



# 	def broken
# 		puts "You broke the light in the #{@room}."
# 	end 
# end	
	


Anja = Person.new("Anja")
Anja.enter_room