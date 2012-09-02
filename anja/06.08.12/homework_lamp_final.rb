class Person
  def initialize(name)
    @name = name
    @room = Room.names.shuffle!.pop
    @lamp = Lamp.new
  end

  def room
    @room
  end

  def enter_room
    puts @name + " goes into the " + @room + "."
    flip_switch
  end

  def flip_switch
     puts "Its dark. " + @name +" turns the light on."
     @lamp.turn_light_on
  end
end

class Room
  class << self        
  #class method is available anywhere in the code
    def names
      @names ||= ['kitchen', 'Dinning room', 'Office']  
      #same: if @names = @names else @name = ['kitchen', 'Dinning room', 'Office'] end
      #if something is already in @name get it or create new new array
    end
  end
end

class Lamp
  def initialize
    @bulb = Bulb.new
    @switch = Switch.new
  end

  def turn_light_on
    i = 0
    while i < 2 do
      @switch.flip
      if @switch.state == :on
        @bulb.on     
      elsif @switch.state == :off
        @bulb.off
      else
        puts "Doesnt work!"
      end
      puts "You flip the switch again"
    i += 1
    end
    @bulb.broken
  end    
end

class Switch
  def initialize
    @state ||= :off
  end

   def state           
   #expose the variable to external world
    @state            
  end

  def flip
    if @state == :off
      @state = :on
    else
      @state = :off  
    end
    #same: @state = @state == :off ? :on : :off   #ternary operator
  end
end

class Bulb
  def initialize
  end

  def on
    puts "The light is on"
  end

  def off
    puts "The light is off"
  end

  def broken
    puts "Great, no the bulb is broken!"
  end
end

Anja = Person.new("Anja")
Anja.enter_room