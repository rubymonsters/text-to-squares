class App
  attr_reader :answer

  def question
    puts "Write a word:"
    @answer = gets.chomp
  end

  def answer_clean
    @answer.gsub(/[^a-zA-Z]/, '').downcase!
  end
end



class WordToColor
  # attr_accessor :word

  def initialize(word)
    @word = word.split(//).to_s   #in seperated letters und in string
    color_of_letter = { 
        "a" => "antiquewhite",
        "b" => "brown",
        "c" => "chocolate",
        "d" =>"darkorange",
        "e" => "eggshell",
        "f" => "firebrick",
        "g" => "goldenrod",
        "h" => "hotpink",
        "i" => "indian red",
        "j" => "indian red",
        "k" => "khaki",
        "l" => "lightsteelblue",
        "m" => "moccasin",
        "n" => "navajowhite",
        "o" => "olivedrab",
        "p" => "plum",
        "q" => "plum",
        "r" => "rosybrown",
        "s" => "seashell",
        "t" => "tomate",
        "u" => "tomate",
        "v" => "tomate",
        "w" => "tomate",
        "x" => "tomate",
        "y" => "tomate",
        "z" => "tomate"
      }
  end

  def color
    color_of_letter.each do | letter, color | 
      if letter == "a"
        color      
      end
    end
  end
end


# puts "Write a word:"

# answer = WordToColor.new

# puts answer.color