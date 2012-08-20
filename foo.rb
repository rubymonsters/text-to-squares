class Room
  class << self
    def names
      @names ||= ['Kitchen', 'Dining room', 'Office']

      # this is the same as:
      #
      # if @names
      #   @names
      # else
      #   @names = ['Kitchen', 'Dining room', 'Office']
      # end
    end
  end

  def initialize
    @name = Room.names.shuffle!.pop
  end
  # that's the same as:
  #
  # def self.names
  #   ['Kitchen', 'Dining room', 'Office']
  # end
end

p Room.names
p Room.names.pop
p Room.names
p Room.names.pop
p Room.names
p Room.names.pop



# class Switch
#   def initialize
#     @state = false
#   end
#
#   def flip
#     # toggle the state
#   end
#
#   def turn_off
#     @state = false
#   end
#
#   def turn_on
#     @state = true
#   end
# end
#
# switch = Switch.new
# switch.turn_on
