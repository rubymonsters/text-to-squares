class Country
  def initialize(name, happy)
    @name  = name     # string
    @happy = happy    # boolean
  end

  def name
    @name
  end

  def happy?
    @happy
  end
end

# The objects "spain" and "britain" are initialized:
# the method "initialize" is called and the two parameters are passed
# each object has two attributes: "name" and "happy"
spain     = Country.new("spain", false)
britain   = Country.new("britain", true)

# The array "countries" is initialized:
# It includes the objects "spain" and "britain"
countries = [spain, britain]

# "unless" ist die Umkehrung von "if": wenn nicht
# also: wenn nicht: spain.happy == true -> puts 
puts "spain is sad :(" unless spain.happy?

# or in this way ...
nation = spain
puts "#{nation.name} is sad :(" unless nation.happy?

# a block is a method, that don't have a name <- anonymus method
# the argument list appears between vertical bars
countries.each do |c|
  puts "#{c.name} is sad :(" unless c.happy?
end

# the same again in one line ...
countries.each { |c| puts "#{c.name} is sad :(" unless c.happy? }

# all, none or 
world_is_happy = countries.all? do |c|
  c.happy?
end
 
if world_is_happy
  puts "all hunky-dory"
else
  puts "meh :("
end

# in the block elements of the array "countries" are pushed into the array "unhappy_countries" if they are "unhappy"; then print the name
unhappy_countries = [] 
countries.each do |c|
   unhappy_countries << c unless c.happy?
end

# the same result with the select-method
# unhappy_countries = countries.select { |c| not c.happy? }

# ... or reject
# unhappy_countries = countries.reject { |c| c.happy? }
  
unhappy_countries.each do |c|
  puts c.name
end

# detect ...
a_happy_country = countries.detect { |c| c.happy? }
puts "very happy is #{a_happy_country.name}"

# map ... can also be collect
country_names = countries.map { |c| c.name }
p country_names
