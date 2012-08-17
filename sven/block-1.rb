class Game
  def self.roles
    @roles ||= ["global", "dough", "waffle", "iron"]
  end
  
  def initialize(rounds = 2)
    @rounds = rounds
  end
  
  def start
    @rounds.times do |round|
      puts "Round #{round + 1}!"
      rules
    end
  end
  
  def rules
    puts "You've got the following roles:"
    players.each do |player|
      puts "#{player.name}: #{player.role}"
    end
    puts # just so the output looks a bit nicer
  end
  
  def players
    @players ||= Game.roles.map do |role|
      name = Player.pick
      Player.new(name, role)
    end
  end
end

class Player
  def self.pick
    names.shuffle!.pop
  end
  
  def self.names
    @names ||= ["Anja", "Maren", "Rebecca", "Sabrina", "Ute"]
  end
  
  attr_reader :name, :role
  
  def initialize(name, role)
    @name = name
    @role = role
  end
end

game = Game.new
game.start