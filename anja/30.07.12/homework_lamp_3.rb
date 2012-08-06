class Lamp
	def initialize
		@bulb = "off"
		puts
		puts "Hurray a new lamp"
		@state_of_the_switch = false
	end

	def switch_on_and_off
		if @state_of_the_switch == false
			puts "Switching the light on."
			@bulb = "on"
			@state_of_the_switch = true
		else 
			puts "Switching the light off."
			@bulb = "off"
			@state_of_the_switch = false
		end
	end

	def show_state
		puts %(The light is #{@bulb}.(The Instance-Variable "state_of_the_switch" is #{@state_of_the_switch}.))
		puts
	end
end


kitchenlamp = Lamp.new

kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state