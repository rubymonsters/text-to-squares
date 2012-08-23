# Come up with an idea for a program that contains at least two classes (a role playing game character)
# Create an empty file, require "test/unit" and add empty class definitions for your new classes.
# Write down your expectations about what the classes do in plain text/comments at the end of the file:
# - How will the classes behave towards their outer world/each other?
# - What will they expose, what behaviour will they offer?
# Write down the method names as empty method definitions (including the arguments list) and add a comment to their body about what the method should do.
# Create an empty test case class for each of your classes.
# Run the file, it should print out the test output.
# Commit and push this.

require "test/unit"

class Character
  def eat(food)
    # if there is food the character can eat it, after a while (like 5 actions) he needs food
  end
  
  def go
    # the character can go, he can go faster if he has a map
  end
  
  def conjure
    # the character can conjure if he has a spell-book
  end
  
  def fight
    # the character can fight, in the simplest case with his fists
  end
  
  def ask_questions
    # the character can ask questions to other characters
  end
end

class Equipment
  def use(item)
    # depending on what item is used, the specific activity improves
  end
  
  def broken?
    # if equipment is broken it can't be used
  end
end

class Food
  def eatable?
    # food can be eatable or not
  end
end

# A Character can eat, go, conjure, fight and ask_questions; he can use equipment to act better
# Equipment can be used for learning magic spells or better fighting
# Food can be eaten and refreshes a character if its eatable

class CharacterTest < Test::Unit::TestCase
end

class EquipmentTest < Test::Unit::TestCase
end

class FoodTest < Test::Unit::TestCase
end