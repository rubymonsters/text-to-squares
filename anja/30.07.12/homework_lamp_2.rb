class Lamp
	def initialize
		@bulb = "off"
		puts
		puts "Hurray a new lamp"
		@state_of_the_switch = false
	end

	def switch_on
		if @state_of_the_switch == false
			puts "Switching the light on."
			puts
			@bulb = "on"
			@state_of_the_switch = true
		else 
			puts "Try to switch the light on."
			puts "Dumbhead, the light is already on."
		end
	end

	def switch_off
		if @state_of_the_switch == true
			puts "Switching the light off."
			puts
			@bulb = "off"
			@state_of_the_switch = false
		else 
			puts "Try to switch the light off."
			puts "Open your Eyes, the light is already off."
			puts
		end
	end

	def show_state
		puts %(The light is #{@bulb}.)
		puts %((The Instance-Variable "state_of_the_switch" is #{@state_of_the_switch}.))
		puts
	end
end


kitchenlamp = Lamp.new

kitchenlamp.show_state
kitchenlamp.switch_on
kitchenlamp.show_state
kitchenlamp.switch_off
kitchenlamp.show_state
kitchenlamp.switch_off
kitchenlamp.show_state