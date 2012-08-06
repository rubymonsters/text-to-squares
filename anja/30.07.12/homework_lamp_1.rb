

class Lamp
	def initialize
		@bulb = "off"
		puts "Hurray a new lamp"
		@number_of_switches_pressed = 0
	end

	def switch_on
		puts "Switching the light on."
		@bulb = "on"
		@number_of_switches_pressed += 1
	end

	def switch_off
		puts "Switching the light off."
		@bulb = "off"
		@number_of_switches_pressed += 1
	end

	def show_state
		puts %(The light is #{@bulb}.)
		puts %(You touched the switch #{@number_of_switches_pressed} times.)
	end
end


kitchenlamp = Lamp.new

kitchenlamp.show_state
kitchenlamp.switch_on
kitchenlamp.show_state
kitchenlamp.switch_off
kitchenlamp.show_state


#neue aufgabe: moderne lampe der den zustand festellen muss in dem die @bulb ist.