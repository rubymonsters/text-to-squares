# 1. cards are known/unknown initialized, show the unknown cards
# 2. cards are randomly set to known or unknown
# 3. unknown cards are shown

class Card
  def initialize(question, answer, known)
    @question = question
    @answer = answer
    @known = known
  end
  
  def question
    @question
  end
  
  def answer
    @answer
  end
  
  def known?
    !!@known
  end
  
  # def set_known
  #   if rand < 0.6
  #     @known = true
  #   else
  #     @known = false
  #   end
  # end
  
  def known!
    @known = true
  end
  
  def unknown!
    @known = false
  end

  def known
    @known
  end
  
  def known=(known)
    @known = known
  end
end

# Objektinitialisierung
first = Card.new("Platon", "Politeia", false)
second = Card.new("Heidegger", "Sein und Zeit", false)
third = Card.new("rot", "gruen", true)
fourth = Card.new("blau", "orange", true)
fifth = Card.new("gelb", "violett", false)

# array of all objects
cards = [first, second, third, fourth, fifth]
puts "all known questions:"
cards.each { |c| puts c.question if c.known? }

# in a new array are all unknown cards collected
unknown_cards = cards.select { |u| not u.known? }
puts "all unknown questions:"
unknown_cards.each { |u| puts u.question }

# der known-Wert jeder Karte wird zufällig auf true or false gesetzt
cards.each { |card| card.known = rand > 0.5 }

cards.each { |card| rand > 0.5 ? card.known! : card.unknown! }

cards.each do |card|
  if rand > 0.5
    card.known!
  else
    card.unknown!
  end
end

puts "all known questions after random change:"
cards.each { |c| puts c.question }



