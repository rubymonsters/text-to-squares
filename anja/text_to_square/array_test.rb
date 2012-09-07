# require 'test/unit'

# words = Array.new

# puts "Schreibe:"
# words = gets.chomp

# puts words

# class Array
#   def text_to_array
#     array = Array.new
#     array << gets.chomp
#   end
# end

# class Array < Test::Unit::TestCase
#   def test_text_to_array

#   end
# end

array = Array.new
array << gets.chomp

puts array.class
puts array



