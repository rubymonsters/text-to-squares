# Prepare
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
  attr_reader :stamina, :conjure_skill, :fight_skill
  
  def initialize(stamina, conjure_skill, fight_skill)
    # if a character is created its stamina is set to 10 points
    # its conjure- and fight-skills are set to 1
    @stamina = stamina
    @conjure_skill = conjure_skill
    @fight_skill = fight_skill
  end
  
  def eat
    # after eating the characters stamina is set to 10 points
    @stamina = 10
  end
  
  def go
    # after going the characters stamina loses 1 point
    # some idea for later: the character can go, he can go faster if he has a map
    @stamina -= 1
  end
  
  def conjure
    # after conjuring the characters stamina loses 2 points
    # some idea for later: the character can conjure if he has a spell-book
    @stamina -= 2
    @conjure_skill += 1
  end
  
  def fight
    # after fighting the characters stamina loses 3 points
    # the character can fight, in the simplest case with his fists
  end
  
  def use(item)
    # depending on what item is used, the specific activity improves
    # if the character uses an item for fighting the chance to win increases
  end
end

class Equipment
  attr_reader :status
  
  def initialize(status)
    @status = status
  end
  
  def status
    # if equipment is broken it can't be used
    # some idea for later: equipment can be used for learning magic spells or better fighting
    if @status == 0
      p "You can't use the item because it's broken"
    else
      @status
    end
  end
end

class Food
  def eatable?
    # food can be eatable or not
  end
end

# Test
# Turn each line of the comment-list into an empty test method.
# Run the file, the test output should change.
# Implement one of the tests by expressing your expectation (e.g. charachter = Character.new; assert_equal 1, character.level)
# Run the file, the test output should change.

class CharacterTest < Test::Unit::TestCase
  def test_character_creation
    # if a character is created its stamina is set to 10 points
    # its conjure- and fight-skills are set to 1
    character = Character.new(10, 1, 1)
    assert character, 'create a character instance'
  end
  
  def test_eat_stamina_is_set_to_10_points
    character = Character.new(0, 1, 1)
    character.eat
    assert_equal character.stamina, 10, 'characters stamina should be set to 10 points'
  end
  
  def test_go_stamina_loses_1_point
    character = Character.new(10, 1, 1)
    character.go
    assert_equal character.stamina, 9, 'characters stamina should loose 1 point'
  end
  
  def test_conjure_stamina_loses_2_points
    character = Character.new(10, 1, 1)
    character.conjure
    assert_equal character.stamina, 8, 'characters stamina should loose 2 points'
  end
  
  def test_conjure_skill_increases_by_1_point
    character = Character.new(10, 1, 1)
    character.conjure
    assert_equal character.conjure_skill, 2, 'characters conjure-skill should increase by 1 point'
  end
  
  def test_fight
    # after fighting the characters stamina loses 3 points
    # its fighting-skill increases by 1 point
  end
  
  def test_use
    # if the character uses an item the chance to win increases
  end
end

class EquipmentTest < Test::Unit::TestCase
  def test_equipment_creation
    # if equipemt is created its status is set to 10
    equipment = Equipment.new(10)
    assert equipment, 'create an equipment instance'
  end
  
  def test_status_is_0_it_can_not_be_used
    equipment = Eqipment.new(0)
    assert_equal equipment.status, 0, 'equipment can not be used because it is broken'
  end

  def test_status_is_not_0_it_can_be_used
    equipment = Eqipment.new(10)
    assert_not_equal equipment.status, 0, 'equipment can be used'
  end
end

class FoodTest < Test::Unit::TestCase
  def test_eatable?
    # food can be eatable or not
  end
end