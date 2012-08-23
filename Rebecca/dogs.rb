
class Dogs
  def initialize(name, gender, age, *look)
    @name = name
    @gender = gender
    @age = age
    @look = look
    @petted = 0

    puts "Dog #{@name} is created.Times petted yet: #{@petted} times"
  end

  def name
    @name
  end

  # def gender
  #   @gender
  # end

  # def age
  #   @age
  # end

  def introduction
    puts "#{@name} is #{@gender}, #{@age} years old, #{@look.join(", ")}"
  end

  def pet
    @petted = @petted + 1
    puts "#{@name} is petted!"
  end

  def petted
    @petted
  end

  def happy?
    petted > 0
  end

  def happy
    puts "#{@name} makes a handstand"
  end

  def unhappy
    puts "#{@name} howls like a wolve"
  end

  def reaction
   happy? ? happy : unhappy
  end
end


bingo = Dogs.new('Bingo', "male", 7, "hairy", "clumsy", "furious" )
doodle = Dogs.new('Doodle', "female", 2, "nosy", "fast", "playful")
puck = Dogs.new('Puck', "male", 4, "deceitful", "snobbish", "fat")

dogs = [bingo, doodle, puck]

dogs.each do |dog|
  dog.introduction
end

5.times do
  dogs.each { |dog| dog.pet if rand > 0.5 }
end

dog = dogs.sort_by { |dog| dog.petted }
dog = dogs.first

dogs.each do |dog|
  puts "#{dog.name} was petted #{dog.petted} times"
end

puts "#{dog.name} was petted most often and is quite a happy chap"

dogs.each do |dog|
  "#{dog.reaction}"
end



