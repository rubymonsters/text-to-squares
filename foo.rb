class Switch
  def initialize(state)
    @state = state
  end

  def state
    @state
  end

  def flip
    if @state == :off
      @state = :on
    else
      @state = :off
    end

    # could also use a ternary operator:
    # @state = @state == :off ? :on : :off
  end
end

switch = Switch.new(:off)
# let's set the internal state of the
# switch to :on
switch.flip

