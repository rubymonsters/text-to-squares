
class Person
	def initialize(name)
		@name = name
		@room = Room.names.shuffle!.pop
		
	end

	def enter_room
		puts @name + " goes into the " + @room + "."
		turn_light_on
	end

	def turn_light_on
		puts "Its dark. " + @name +" turns the light on."
		@lamp = Lamp.new(@room)
		@lamp.flip_switch
	end
end

class Room
	def self.names
		["kitchen", "floor" , "bathroom" , "dinning room"]
	end
end

class Lamp
 	def initialize(room)
 		@switch = true   #Switch.new(true)
 		@bulb = true	#Bulb.new
 		@room = room

 	end

 	def flip_switch()
		if @bulb == true   #statt @bulb  @bulb.on == true
 			puts "Now the light in the #{@room} is on."	#?didnt know how to take the var @room from class Person
 		else
			puts "The light in the #{@room} was already on. You turned it off."
 		end
 	end
 end


class Switch
 	def initialize(state)
 		@state = state					#true or false	
 	end

 	def state
 		@state
 	end

 	def flip
 		if @state == true
 			@state = false				#switch is off => bulp is off
 		else
 			@state = true				#switch is on => bulp is on
 		end
 		# @state = not @state, doesnt work
 	end
 end

 class Bulb
 	def initialize()
 	end

 	def on
 		if Switch.state == true			#var @state aus der switch klasse 
 			return true					#Bulb is on
 		else
 			return false				#Bulb is off
 		end
 	end

 end



# 	def broken
# 		puts "You broke the light in the #{@room}."
# 	end 
# end	
	


Anja = Person.new("Anja")
Anja.enter_room