class Game
  def initialize(rounds)
    @rounds = rounds
    @round = 0
  end
  
  def print_rules
    puts "[challenge] Think of a change to the code that makes sense. Pick up the keyboard and make the change. Save the file"
    puts "[response]  Explain the change that just was made. Fix it if you think it's wrong. Run the code and see if it works. Make sure it works."
    puts
    puts "1. Read the code in sven/waffles.rb."
    puts "2. Discuss it! Figure out what it does."
    puts "3. Now the games may begin ..."
  end
  
  def start
    1.upto(@rounds) do
      puts # just so the output is a bit nicer
      next_round
      pilot.challenge
      copilot.respond
    end
  end
  
  def pilot
    Player.all[@round - 1]
  end
  
  def copilot
    Player.all[@round] || Player.all[0]
  end    
  
  def next_round
    if @round < Player.count
      @round = @round + 1
    else
      @round = 1
    end
    puts "Round #{@round}!"
  end
end

class Player  
  def self.all
    @all ||= names.map { |name| Player.new(name) }
  end

  def self.names
    @names ||= ["Anja", "Sabrina", "Rebecca", "Maren"]
  end
  
  def self.count
    names.count
  end
  
  def initialize(name)
    @name = name
  end
  
  def challenge
    puts "Player #{@name} challenges."
  end
  
  def respond
    puts "Player #{@name} responds."
  end
end

game = Game.new(8)
game.print_rules
game.start