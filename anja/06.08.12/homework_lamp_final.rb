class Person
  def initialize(name)
    @name = name
    @room = Room.names.shuffle!.pop
    @lamp = Lamp.new
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
    @bulb = Bulb.new.status
    @switch = Switch.new
  end

  def turn_light_on
    if @switch.state = :on
      @bulp.on
    elsif @switch.state = :off
      @bulb.off
    else
      puts "Doesnt work!"
    end
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
    @switch = Switch.new.flip
    @bulb ||= :off
  end

  def status
    if @switch == :on
      @bulb = :on
    else 
      @bulb = :off
    end
  end
end

Anja = Person.new("Anja")
Anja.enter_room




if @bulb == :on
      puts "The light turns on."
    elsif @bulb == :off
      puts "The light turns off."
    else
      puts "Nothing worked"
    end
  end