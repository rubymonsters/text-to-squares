class App

  def initialize(answer)
    @answer = answer

  end

  def modifiy_string_in_array
    @answer.map { |w| puts w.chomp.upcase}
  end



end


puts "Please enter your poem:"
poem = Array.new
poem << gets.chomp

puts poem.class
puts poem

square = App.new(poem)
square.modifiy_string_in_array

