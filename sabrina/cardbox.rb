class Cardbox
  def initialize
    puts "localisation: method initialize"
    @question = 'Ask a question'
    @answer = 'Here is the answer'
    @category = 'Topic of the cardbox'
  end
  
  def create_card
    puts "localisation: method create_card"
    @card = ['Ask another question', 'Another answer']
  end
  
  def show_card
    puts "localisation: method show_card"
    puts @question
    puts @answer
  end
  
  def edit_card(question, answer)
    puts "localisation: method edit_card"
    @question = question #'edited question'
    @answer = answer #'edited answer'
  end
end

class User
  def initialize
    @name = 'Username'
  end
  
  def study
    @learningcards
  end
end

# instantiate the class Cardbox
# assign the new object to a local variable
# call a method on it

mycard = Cardbox.new
mycard.show_card

# show_card can be called directly, because 'new' returns the object (and calls the method initialize)
# wenn ich show_card direkt hinter new aufrufe, kann ich mit mycard keine weitere Methode aufrufen

mycard.edit_card('edited question', 'edited answer') # broken

mynewcard = Cardbox.new
puts mynewcard.create_card

# every method returns whatever the last line evaluates to, therefore the method 'create_card' returns an array that 'puts' prints
