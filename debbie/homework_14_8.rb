class Animal
  def initialize(options ={})
    @name = options[:name]
    @big = options[:big]
    @hungry = options [:hungry]
  end
  
  def name
    @name
  end
  
  def big?
    @big
  end
  
  def hungry?
    @hungry
  end
  
end


#some objects to work with
bumblebee = Animal.new(:name => "Bumblebee", :big =>false, :hungry=>true)
giraffe   = Animal.new(:name => "Giraffe", :big =>true, :hungry=>true)
elephant  = Animal.new(:name => "Elephant", :big =>true, :hungry=>false)
spider    = Animal.new(:name => "Spider", :big =>false, :hungry=>false)
animals = [bumblebee, giraffe, elephant, spider]

#first lesson messing with Carlas code
puts bumblebee.big?
puts bumblebee.hungry?

#the unless statement and placeholder
animal = elephant
puts "The #{animal.name} is not hungry" unless elephant.hungry?
animal = spider
puts "The #{animal.name} is not a huge animal" unless spider.big?

#learn to use #each
animals.each do |c|
  puts "The #{c.name} is very hungry" if c.hungry?
end

animals.each do |c|
  puts "The #{c.name} is very small animal" unless c.big?
end

#one line blocks
animals.each {|c| puts "The #{c.name} is very small" unless c.big?}

#use all
zoo_is_hungry = animals.all? do |c|
 c.hungry?
end


if zoo_is_hungry
  puts "We need food for all!"
else
  puts "We only need food for some of the animals"
end

#use any
zoo_hasonly_biganimals = animals.any? do |c|
c.big?
end
#question debbie: how to tell him to print the result of the any ?


zoo_hasonly_biganimals.each do |c|
 puts c.name
end

#use none?
zoo_isnot_hungry = animals.none? do |c|
 c.hungry?
end

if zoo_isnot_hungry
  puts "None of the animals are hungry"
else
  puts "Some of the animals are hungry"
end

#array of big animals, or of hungry animals
small_animals = []

animals.each do |c|
  small_animals << c unless c.big? 
end

small_animals.each do |c|
 puts c.name
end


big_animals = []

big_animals.each do |c|
  big_animals << if c.big?
  end
end

big_animals.each do |c|
  puts c.name
end


#select statement
big_animals    = animals.select {|c| c.big?}
small_animals  = animals.select {|c| not c.big?}
hungry_animals = animals.select {|c| c.hungry?}
feed_animals   = animals.select {|c| not c.hungry?}

hungry_animals.each do |c|
  puts c.name
end

#reject statement
big_animals    = animals.reject {|c| not c.big?}
small_animals  = animals.reject {|c| c.big?}
hungry_animals = animals.reject {|c| not c.hungry?}
feed_animals   = animals.reject {|c| c.hungry?}

feed_animals.each do |c|
  puts c.name
end

# detect
a_hungry_animal = animals.detect {|c| c.hungry?}
puts "very hungry is the #{a_hungry_animal.name}"

# map or collect
animal_names = animals.map { |c| c.name}
p animal_names