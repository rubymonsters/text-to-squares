# 1. cards are initialized known/unknown
# 2. known questions of cards are printed, then the unknown
# 3. cards are randomly set to known or unknown
# 4. unknown cards are printed after random setting

class Card
  def initialize(question, answer, known)
    @question = question
    @answer = answer
    @known = known
  end

# attribute-reader: this methods does nothing else but give back an instance-variable
  def question
    @question
  end
  
  def answer
    @answer
  end

  def known
    @known
  end

# attribute-writer: the methode assigns the parameter to the instance-variable
  def known=(known)
    @known = known
  end

# if the method ask a yes-no-question, then it should end in a question mark
# !! = not not = to make shure to return a boolean
  def known?
    !!@known
  end

# if the method modifies the object that is called, then it should end in an exclamation point  
  def known!
    @known = true
  end

  def unknown!
    @known = false
  end
  
# it's more logical to put the random setting outside the class,
# because it's not a behavior of the class
  # def set_known
  #   if rand < 0.6
  #     @known = true
  #   else
  #     @known = false
  #   end
  # end
end

# object-initialization
first = Card.new("Platon", "Politeia", false)
second = Card.new("Heidegger", "Sein und Zeit", false)
third = Card.new("rot", "gruen", true)
fourth = Card.new("blau", "orange", true)
fifth = Card.new("gelb", "violett", false)

# array of all objects
cards = [first, second, third, fourth, fifth]
puts "all known questions:"
cards.each { |card| puts card.question if card.known? }

# in a new array all unknown cards are collected
unknown_cards = cards.select { |unknown_card| not unknown_card.known? }
puts "all unknown questions:"
unknown_cards.each { |unknown_card| puts unknown_card.question }

# every card is randomly set to true or false
# first option has quite a lot lines:
# cards.each do |card|
#   if rand > 0.5
#     card.known!
#   else
#     card.unknown!
#   end
# end

# second option is easier:
# cards.each { |card| rand > 0.5 ? card.known! : card.unknown! }

# the third is the most elegant:
# ruby knows, that the equal sign belongs to the method-name:
cards.each { |card| card.known = rand > 0.5 }

puts "all known questions after random change:"
cards.each { |card| puts card.question if card.known? }



