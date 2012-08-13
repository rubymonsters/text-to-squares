class Switch
  def initialize
    @state = false
  end

  def flip
    # toggle the state
  end

  def turn_off
    @state = false
  end

  def turn_on
    @state = true
  end
end

switch = Switch.new
switch.turn_on
