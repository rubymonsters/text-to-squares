
class Person
	def initialize(name)
		@name = name
		@room = Room.names.shuffle!.pop
		@lamp = Lamp.new
	end

	def enter_room
		puts @name + " goes into the " + @room + "."
		puts "Its dark. " + @name +" turns the light on."
		@lamp.light_comes_on 
	end
end

class Room
	def self.names
		["kitchen", "floor" , "bathroom" , "dinning room"]
	end
end

class Lamp
 	def initialize()
 		
 	end

 	def light_comes_on
		puts "light_comes_on"
 	end
 end

 Anja = Person.new("Anja")
 Anja.enter_room