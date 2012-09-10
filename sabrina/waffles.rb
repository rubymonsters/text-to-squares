class Dough
  attr_reader :ingredients
  
  def initialize(ingredients)
    @ingredients = ingredients
  end
  
  def has?(ingredient)
    ingredients.include?(ingredient)
  end
end

class Waffle
  attr_reader :dough
  
  def initialize(dough)
    @dough = dough
    @state = :uncooked
  end

  def bake
    @state = :done
  end
  
  def done?
    @state == :done
  end
end

class Iron
  def initialize
    @state = :cold
  end

  def heatup
    @state = :hot
  end

  def ready?
    @state == :hot                                # returns true if iron is hot
  end

  def receive(dough)
    @waffle = Waffle.new(dough)                   # a waffle-object is always created
    if not ready?
      puts "Don't add dough to a cold iron!"
    end
  end

  def bake
    if ready?
      @waffle.bake
      @waffle
    else
      puts "Can't bake with a cold iron!"
     @waffle
    end
  end
end

class Topping
  def initialize(toppings)
    @topping = toppings.shuffle.pop
    @topping
  end
  
  def place
    "Put #{@topping} on the waffle!"
  end
end

ingredients = [:flour, :eggs, :sugar, :butter]
dough = Dough.new(ingredients)
iron = Iron.new

iron.heatup
iron.receive(dough)

waffle = iron.bake
puts 'The dough contains:'
p waffle.dough.ingredients

if dough.has?(:milk)
  puts "dough contains milk"
else
  puts "dough doesn't contain milk"
end

if waffle.done?
  toppings = [:chocolate, :marmelade, :fruits]
  topping = Topping.new(toppings)
  p topping.place 
else
  puts "No waffle done"
end
