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

# class Waffle
#   attr_reader :dough
#   
#   def initialize(dough)
#     @dough = dough
#     @state = :uncooked
#   end
# 
#   def bake
#     @state = :done
#   end
#   
#   def done?
#     @state == :done
#   end
# end
# 
# class Iron
#   def initialize
#     @state = :cold
#   end
# 
#   def heatup
#     @state = :hot
#   end
# 
#   def ready?
#     @state == :hot
#     
#   end
# 
#   def receive(dough)
#     #if ready?
#       @waffle = Waffle.new(dough)
#       #else
#       #puts "Don't add dough to a cold iron!"
#       #end
#   end
# 
#   def bake
#     if ready?
#       @waffle.bake
#       @waffle
#     else
#       puts "Can't bake with a cold iron!"
#      @waffle
#     end
#   end
# end
# 
# class Topping
#   def initialize(toppings)
#     @topping = toppings.shuffle.pop
#     @topping
#   end
#   
#   def choose
#     
#   end
#   
#   def place
#     "Put  #{@topping}  on the waffle!"
#   end
# end


class DoughTest < Test::Unit::TestCase
  def test_creation
    dough = Dough.new([:flour, :eggs, :sugar, :butter])
    assert dough, 'create a dough instance'
  end

  def test_a_dough_which_was_passed_eggs_should_have_eggs
    dough = Dough.new([:eggs])
    assert dough.has?(:eggs), 'should have eggs'
  end
  
  def test_a_dough_which_was_not_passed_milk_shouldnt_have_milk
    dough = Dough.new([:flour])
    assert !dough.has?(:milk), 'should not have milk'
  end
  
  def test_dough_which_contains_flour_should_be_vegan
    dough = Dough.new([:flour])
    assert dough.vegan?, 'should be vegan'
  end
  
  def test_dough_which_contains_eggs_Shoudnt_be_vegan
    dough = Dough.new([:eggs])
    assert !dough.vegan?, 'should not be vegan'
  end
end


# # Vegan should allow :flour
# if Vegan.allowed?(:flour)
#   puts "success: Vegan allows flour"
# else
#   puts "failure: Vegan does not allow flour"
# end
# 
# # Vegan shoud not allow :eggs
# unless Vegan.allowed?(:eggs)
#   puts "success: Vegan does not allow eggs"
# else
#   puts "failure: Vegan allows eggs"
# end
# 
# 
# 
# 
# 
# 
# 
# # dough = Dough.new(ingredients)
# # if dough.has?(:milk)
# #   puts "has milk"
# # else
# #   puts "has no milk"
# # end
# 
# 
# 
# # iron = Iron.new
# # iron.heatup
# # iron.receive(dough)
# # # iron.ready?
# # #else
# # #  puts "not ok"
# # #end
# # waffle = iron.bake
# # 
# # if waffle.done?
# #   toppings = [:chocolate, :marmelade, :fruits]
# #   topping = Topping.new(toppings)
# #   p topping.place 
# # else
# #   puts "No waffle done"
# # end
# # p waffle.dough.ingredients
# # 
