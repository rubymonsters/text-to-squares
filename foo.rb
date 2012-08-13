class Switch
  # attr_reader :state
  # attr_writer :state
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def state
    @state
  end

  def state=(state)
    @state = state
  end
end

switch = Switch.new :off

# let's set the internal state of the
# switch to :on
switch.state = :on

# that's the same as this:
# switch.state=(:on)

