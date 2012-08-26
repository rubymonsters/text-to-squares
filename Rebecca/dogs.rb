
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

dogs = dogs.sort_by { |dog| dog.petted }
dogs.each do |dog|
  puts "#{dog.name} was petted #{dog.petted} times"
end

dog = dogs.last
puts "#{dog.name} was petted most often and is quite a happy chap"
#last dog is always chosen from the list, even if all dogs were petted 0 times.
#Since that makes no sense I have to find a way to print this only under certain circumstances. 

dogs.each do |dog|
  "#{dog.reaction}"
end
#have to figure out why I can´t put this reaction part at the end
#of the code: because then sometimes one dog´s reaction is not showing up. 

groups= dogs.group_by { |dog| dog.petted }.select { |k, v| v.size > 1 }
#Collecting equal numbers (if there are any). Still have to check what the .select method is 
#exactly doing and why it must be > 1.
groups.each do |petted, dogs|
  names = dogs.map { |dog| dog.name }
  puts "#{names.join(", ")} were equally petted #{petted} times. What a coincidence! "
end

