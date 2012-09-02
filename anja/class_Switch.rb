class Switch
  def initialize(state)
    @state = state   #internal(private) variable
  end

  def state           #expose the variable to external world
    @state            #attribute reader
  end

  #its the same as 
  #attr_reader :state       attribute reader
  #attr_writer :state       attribute writer
    #OR
  #attr_accessor :state


  def flip
    #not @state
    if @state == :off
      @state = :on
    else
      @state = :off  
    end
    #or 
    #@state = @state == :off ? :on : :off   #ternary operator
  end

  def state=(state)    #attribute writer
    @state = state      #write the variable to th external world(open door),var can be writte
    
  end

end

switch = Switch.new(:off)     #switch = Switch.new(false) try it out!
# if switch.state == :on
#   puts "the switch is on"
# else
#   puts "the switch is off"
# end
# switch.flip
switch.state =  :on       # with an equal sign you can left a space in between
puts switch.state