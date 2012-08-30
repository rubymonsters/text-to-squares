class WordToColor
  # attr_accessor :word

  def initialize(word)
    @word = word.split(//).to_s   #in seperated letters und in string
  end

  def color_of_word
    @word.gsub(/\b(a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z)\b/i) do |l|   
    #\b == matches a word boundary?  /i == case insesitive
    case l.downcase
      when "a"
        "antiquewhite"
      when "b"
        "brown"
      when "c"
        "chocolate"
      when "d"
        "darkorange"
      when "e"
        "eggshell"
      when "f"
        "firebrick"
      when "g"
        "goldenrod"
      when "h"
        "hotpink"
      when "i"
        "indian red"
      when "k"
        "khaki"
      when "l"
        "lightsteelblue"
      when "m"
        "moccasin"
      when "n"
        "navajowhite"
      when "o"
        "olivedrab"
      when "p"
        "plum"
      when "r"
        "rosybrown"
      when "s"
        "seashell"
      when "t"
        "tomate"
      else
        "no color defined yet"
      end
    end
  end
end



puts "Write a word:"

answer = WordToColor.new gets.chomp

puts answer.color_of_word

