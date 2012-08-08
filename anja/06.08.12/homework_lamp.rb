
#du befindest dich in einem zufällig ausgewähltem raum und machst eine lampe an und aus
#dann geht die lampe kaputt und du gehst den nächsten raum


Lamps_in_flat = [ "kitchen", "bathroom", "floor", "dining_room"]


class Lamp
	def initialize
		@room = Lamps_in_flat[rand(Lamps_in_flat.length)]
		Lamps_in_flat.delete(@room)   #den raum aus dem array entfernen
		@bulb = "off"
		@switch_count = 0
		puts
		puts 'You are now in the ' + @room + ' and turn the light on.'
		@state_of_the_switch = false
	end

	def switch_on_and_off
		while @switch_count < 2
			if @state_of_the_switch == false
				puts "Switching the light on."
				# @bulb = "on"
				@state_of_the_switch = true
				@switch_count += 1
				# show_state

			else  @state_of_the_switch == true
				puts "Switching the light off."
				# @bulb = "off"
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
		unless Lamps_in_flat.empty? 
			puts "Great, now the bulp broke!"
			puts "You are going to the next room."
			nextroom = Lamp.new
			nextroom.switch_on_and_off
		end
	
		puts "Now you broke all the lamps in the flat!"
		exit
	end
end


lamp = Lamp.new

lamp.switch_on_and_off

