class App

  def initialize(poem)
    @poem = poem

  end

  def normalize_string
    @poem.chomp!.upcase!
  end



end


puts "Please enter your poem:"
poem = []
poem << gets.chomp


squares = App.new(poem)
squares.normalize_string

puts poem