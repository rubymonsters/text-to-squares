class Country
	def initialize(name, happy) 
		@name = name
		@happy = happy
	end
	
	def name
		@name
	end

	def happy?
		@happy
	end
end


spain = Country.new("spain", false)
britain = Country.new("britain", true)
germany = Country.new("germany", false)
countries = [spain,britain,germany]  #objects in array

unhappy_countries = countries.select { |c| not c.happy?} #select gibt array zurück
very_happy_countries = countries.detect { |c| c.happy?} #detect gibt objekt zurück

puts unhappy_countries.class
puts very_happy_countries.class

exit

unhappy_countries.each do |c|
	puts "unhappy_countries:  #{c.name}."
end

very_happy_countries.each do |c|
	puts "very_happy_countries:  #{c.name}."
end

# country_names = countries.map { |c| c.name }

# puts country_names

# puts "Not happy is #{unhappy_countries.name}"
# puts "A very happy countries #{very_happy_coutries.name}"

# countries.each do |c|   #argument, local variable, block is a message without name
# 	puts "Hello #{c.name} is #{c.happy?}"
# end

# #countries.each { |c| puts "Hello #{c.name} is #{c.happy?)"}

# world_is_happy = countries.all? { |c| c.happy?}

# #world_is_happy = countries.all? do |c|        => false
# #	c.happy?
# #end

# #world_is_happy = countries.any? { |c| c.happy?} => true

# #world_is_happy = countries.none? { |c| c.happy?} => false


# if world_is_happy
# 	puts "all hunkey-dory"
# else
# 	puts "meh"
# end



# ["spain"].each do |c|
# 	puts "Hello #{c}"
# end


# unhappy_countries = []

# countries.each do |c|
# 	unhappy_countries << c unless c.happy?
# end

# unhappy_countries.each do |c|
# 	puts c.name
# end


# # if not spain.happy?
# # 	puts "Spain is sad"
# # end

# # puts "Spain is sad" unless spain.happy?
# # puts "Britain is sad" unless britain.happy?	

# # if countries.size < 3
# # 	puts "That is not enough" 
# # end

# # == puts "That is not enough" if countries.size < 3   