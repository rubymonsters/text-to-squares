#first test then programm 



require 'test/unit'

class Vegan
  def self.allowed?(ingredient)
    not [:eggs, :butter, :milk].include?(ingredient)
  end
end

class Dough
  attr_reader :ingredients
  
  def initialize(ingredients)
    @ingredients = ingredients
  end
  
  def has?(ingredient)
    ingredients.include?(ingredient)
  end
  
  def vegan?
    ingredients.all? { |ingredient| Vegan.allowed?(ingredient) }
  end
end

class DoughTest < Test::Unit::TestCase
  def test_creation
    dough = Dough.new([:flour, :eggs, :sugar, :butter])
    assert dough, 'create a dough instance'    #assert = annehmen
  end

  def test_a_dough_which_was_passed_eggs_should_have_eggs
    dough = Dough.new([:eggs])
    assert dough.has?(:eggs)  , 'has eggs'
  end
end