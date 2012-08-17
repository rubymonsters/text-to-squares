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


ingredients = [:flour, :eggs, :sugar, :butter]


# i should be able to create a Dough instance
dough = Dough.new(ingredients)
if dough
  puts "successfully created a dough instance"
else
  puts "failed to create a Dough instance"
end

# a dough which was passed :eggs as an ingredient should have this ingredient
dough = Dough.new(ingredients)
if dough.has?(:eggs)
  puts "success: the dough has eggs"
else
  puts "failure: the dough does not have eggs, but should!"
end

# a dough which was not passed :milk as an ingredient should not have this ingredient
dough = Dough.new(ingredients)
unless dough.has?(:milk)
  puts "success: the dough does not has milk"
else
  puts "failure: the dough has milk, but shouldn't!"
end

# a dough which contains :flour should be vegan
dough = Dough.new([:flour])
if dough.vegan?
  puts "success: the dough is vegan"
else
  puts "failure: the dough is not vegan, but should be"
end

# a dough which contains :eggs should not be vegan
dough = Dough.new([:eggs])
unless dough.vegan?
  puts "success: the dough is not vegan"
else
  puts "failure: the dough is vegan, but shouldn't"
end

# Vegan should allow :flour
if Vegan.allowed?(:flour)
  puts "success: Vegan allows flour"
else
  puts "failure: Vegan does not allow flour"
end

# Vegan shoud not allow :eggs
unless Vegan.allowed?(:eggs)
  puts "success: Vegan does not allow eggs"
else
  puts "failure: Vegan allows eggs"
end







# dough = Dough.new(ingredients)
# if dough.has?(:milk)
#   puts "has milk"
# else
#   puts "has no milk"
# end



# iron = Iron.new
# iron.heatup
# iron.receive(dough)
# # iron.ready?
# #else
# #  puts "not ok"
# #end
# waffle = iron.bake
# 
# if waffle.done?
#   toppings = [:chocolate, :marmelade, :fruits]
#   topping = Topping.new(toppings)
#   p topping.place 
# else
#   puts "No waffle done"
# end
# p waffle.dough.ingredients
# 
