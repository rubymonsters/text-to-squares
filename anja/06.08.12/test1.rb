ROOM_NAMES = ["kitchen", "floor", "bathroom", "dinning room"]

class Room
  def self.instances
  	@room = ROOM_NAMES.map { |n| puts n }
    # any idea what would go here? so it uses `map` on `ROOM_NAMES` but 
    # also stores the new array so we can always access it?
  end

  def print
  	puts ROOM_NAMES.last
  	
  end
end

newroom = Room.new.print


