

class Lamp
	def switch_on
		puts "The Light is on."
		@state = @state.to_i + 1
		puts %(You turned the light #{@state} times on.)
	end

	def switch_off
		puts "The Light is off."
	end
end


kitchenlamp = Lamp.new

kitchenlamp.switch_on
kitchenlamp.switch_off
kitchenlamp.switch_on
kitchenlamp.switch_off
kitchenlamp.switch_on