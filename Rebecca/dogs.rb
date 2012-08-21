
class Dogs
  def initialize(name)
    @name = name
    @petted = 0
    #@sticks_thrown = 0
    puts "Dog #{@name} is created. Times petted yet: #{@petted} times." 
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

  def petted
    @petted
  end

  def happy(*reaction)
    puts "#{@name} is happy, #{reaction.join(', ')}."
  end

  def unhappy
    puts "#{@name} shows you the middle finger and hates you forever."
  end
end


dogs = [Dogs.new('Bingo'), Dogs.new('Doodle')]

puts dogs[0].introduction("male", 7, "hairy", "clumsy", "furious", "old")
puts dogs[1].introduction("female", 2, "nosy", "fast", "playful")

5.times do
  dogs.each { |dog| dog.pet if rand > 0.5 }
end

dog1 = dogs[0]
dog2 = dogs[1]

#I wanted to use the dogs.sort_by { |dog| dog.petted } option and afterwards
#the dog = dogs.first, but then I didn´t know how to get to the dog that wasn´t
#first because I also wanted to display his "score". So I opted for the way below which
#I think is too long-winded? 

puts "Total amount of dogs petted: #{dog1.petted + dog2.petted} times."
puts "#{dog1.name} was petted: #{dog1.petted} times!"
puts "#{dog2.name} was petted: #{dog2.petted} times!"

if dog1.petted == dog2.petted
  puts "Both dogs were petted equally."
  puts "#{dog1.name} and #{dog2.name} jump happily on your lap and your chair breaks."
elsif
  dog1.petted < dog2.petted
  puts "#{dog2.name} was petted most."
  puts "#{dog2.happy("makes a handstand", "jumps on your lap", "licks your nose")}"
  puts "#{dog1.unhappy}"

else
  puts "#{dog1.name} was petted most."
  puts "#{dog1.happy("howls like a wolve", "hops on your lap", "licks your hand")}"
  puts "#{dog2.unhappy}"
  #if I don´t put the last line in "#{}" it will return a nil afterwards. No error  
  #though,just a nil. But why? Also, the last line in "elsif/else" will show and empty 
  #line (when run in terminal). Why?
end

#Note: I think the whole last part, especially the if block is a little much?
#and unhandy? Especially if I am thinking about making 10 more dogs!!!!!!! 
#I am sure there is probably just a 2 line code ot get the same results? 


#In general: imagine I wanted to also make 10 more actions besides "petted",  
#wouldn´t it all, squezzed in this one class, get out of control at some point?
#I guess I should then rather have a class for "dogs", a class for "fetch stick", 
#a class for "petted" etc? 

