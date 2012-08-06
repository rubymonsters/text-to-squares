Lamps_in_flat = [ "kitchen", "bathroom", "floor", "dining_room"]


class Lamp
	def initialize
		@room = Lamps_in_flat[rand(Lamps_in_flat.length)]
		#@room = Lamps_in_flat.sample #in ruby 1.9. testen!!
		@bulb = "off"
		@switch_count = 0
		puts
		puts 'Hurray a new lamp in the ' + @room + '.'
		@state_of_the_switch = false
	end

	def switch_on_and_off
		while @switch_count < 10
			if @state_of_the_switch == false
				puts "Switching the light on."
				@bulb = "on"
				@state_of_the_switch = true
				@switch_count += 1
				# show_state

			else  @state_of_the_switch == true
				puts "Switching the light off."
				@bulb = "off"
				@state_of_the_switch = false
				@switch_count += 1
				# show_state
			end
		end
		bulp = Bulp.new
		bulp.breaks
	end

	def show_state
		puts %(The light is #{@bulb}.)
		puts %((state_of_the_switch = #{@state_of_the_switch} & switch_count = #{@switch_count}))
		puts
	end
end

class Bulp
	def breaks
		puts "Great, now the lamp broke!"
		exit
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
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state
kitchenlamp.switch_on_and_off
kitchenlamp.show_state