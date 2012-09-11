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
    @state == :hot
  end

  def receive(dough)
    if ready?
      @waffle = Waffle.new(dough)
    else
      puts "Don't add dough to a cold iron!"
    end
  end

  def bake
    if ready?
      @waffle.bake
      @waffle
    else
      puts "Can't bake with a cold iron!"
    end
  end
end

ingredients = [:flour, :eggs, :sugar, :butter]
dough = Dough.new(ingredients)

iron = Iron.new
iron.heatup
iron.receive(dough)
waffle = iron.bake

p waffle.done?
p waffle.dough.ingredients