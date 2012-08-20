#creating dogs and let them ask a question

class Dogs
  def initialize (options ={})
    @name = options [:name]
    @happy = options [:happy]
    @sad = options [:sad]
    @speak = options [:speak]
  end

  def introduce
  puts @speak
  puts  "My name is " + @name.upcase + " and the name is " + @name.length.to_s + " characters long."
  end

  def look(*look)   
    puts "More important facts about me:"
  look.each do |look|
    puts "I am " + look + "!"
  end

  def happy
  @happy
  end

  def sad
  @sad
  end

  def speak
    @speak
  end

  def behaviour
    
    puts "Will you pet me?"
  	reply = gets.chomp.downcase

  	if reply == "yes"
   3.times do 
   puts @speak + ". " + @name + " is " + @happy 
   end
   puts "[" + @name + " jumps on your lap and you are friends forever]"

elsif reply == "no" 
	puts "'Roaaarrrrr' [" + @name + " is " + @sad + " and attacks you! Better run!]"
	else puts "Please type 'yes' or 'no'." 
		behaviour
		end
   end
end
end


doodle = Dogs.new(:name => 'Doodle',:happy => "happy", :sad => "sad",:speak => "'Wau Wau'")
bingo = Dogs.new(:name => 'Bingo', :happy => "happy", :sad => "sad", :speak => "'Bow Wow'")


doodle.introduce
doodle.look("from Germany", "hairy", "clumsy", "slow", "furious",)
doodle.behaviour

bingo.introduce
bingo.look( "from England", "big", "fast", "smart", "loyal")
bingo.behaviour

#question: how can I have both (all that are created) dogs "speak" in turns?


