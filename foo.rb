class Switch
  def initialize(state)
    @state = state
  end

  def state
    @state
  end
end

switch = Switch.new(:off)
if switch.state == :on
  puts "the switch is on"
else
  puts "the switch is off"
end

