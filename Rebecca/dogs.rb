
class Dogs
  def initialize(name)
    @name = name
    @petted = 0
    # @sticks_thrown = 0
    puts "#Dog #{@name} is created. Times petted yet: #{@petted} times." 
  end

  def name
    @name
  end

  def introduction(gender, age, *look)
    "Meet dog #{@name}. He is #{gender}, #{age} years old, #{look.join(', ')}."
  end

   def pet
    @petted = @petted + 1
     puts "#{@name} is petted!"
  end

  def name
    @name
  end

  def petted
    @petted
  end
end


dogs = [Dogs.new('Bingo'), Dogs.new('Doodle')]

puts dogs[0].introduction("male", 7, "hairy", "clumsy", "furious", "old")
puts dogs[1].introduction("female", 2, "nosy", "fast", "playful")

5.times do
  dogs.each { |dog| dog.pet if rand > 0.5 }
end

dogs = dogs.sort_by { |dog| dog.petted}
#^^#dogs = dogs.sort { |dog| dog.petted }  <---this gave me a warning:
#(warning: multiple values for a block parameter (2 for 1). so I put sort_by and it worked I guess?
dog1 = dogs[0]
dog2 = dogs[1]
#dog = dogs.first 
#^^I didn´t use it because I wanted both dogs to display the amount petted,
#Have to find out how to do this for both. 
puts "#Total amount of dogs petted: #{dog1.petted + dog2.petted} times."
puts "##{dog1.name} was petted #{dog1.petted} times!"
puts "##{dog2.name} was petted #{dog2.petted} times!"


if dog1.petted == dog2.petted
  puts "#Both dogs were petted equally."
elsif
  dog1.petted <= dog2.petted
  puts "##{dog2.name} was petted most."
else
  puts "##{dog1.name} was petted most."
end

