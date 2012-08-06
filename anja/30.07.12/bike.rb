

class Bike
	def look(color, size, options = {})
		@color = color
		@size = size
		@brand = options[:brand] || 'unknown sender' 
		puts %(The bike is #{@color}, a #{@size} size and the brand is #{@brand}.)
	end
end

Fahrrad1 = Bike.new
Fahrrad1.look('red', 'small', 'Puky')

Fahrrad2 = Bike.new
Fahrrad2.look('green', 'big')

