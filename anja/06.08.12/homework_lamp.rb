class Person
	def initialize(name)
		@name = name
		@room = Room.names.shuffle!.pop
		@lamp = Lamp.new
	end

	def room
		@room
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
 		@switch = Switch.new
 	end

 	def light_comes_on
 		if @switch.state == :on
			puts "The lamp in the "# möchte den Raum ansprechen!+ Person.room + "# comes on."
			@switch.flip
		elsif @switch.state == :off
			puts "The Light was already on. You turned it off."
			@switch.flip
		else
			puts "Nothing works"
		end
 	end
end

class Switch
  def initialize
    @state = state   #internal(private) variable
  end

  def state           #expose the variable to external world
    @state ||= :off            #attribute reader
  end

  def flip
    if @state == :off
      @state = :on
    else
      @state = :off  
    end
  end
end


Anja = Person.new("Anja")
Anja.enter_room
 