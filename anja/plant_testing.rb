require 'test/unit'

class Person
  attr_reader :name, :plants

  def initialize(name)
    @plants = []
    @name   = name
  end

  def add_plant(some_plant)
    @plants << some_plant
  end

  def need_to_water?
    @plants.any? { |p| p.status == :dry}
  end

  def give_water
    if need_to_water?
      @plants.status = :wet
    end
  end

end

class Plant
  attr_reader :status, :name
  attr_writer :status

  def initialize(plant_name)
    @name   = plant_name
    @size   = 1
    @status = :dry
  end

  def grow        #if wet => grow
    if status = :wet
      @size = @size + 1  # += 1
    end
  end
end

class WateringCan #could also be self class
  def self.pours_water  #pour water if plant dry
    true
  end
end


class PersonTest < Test::Unit::TestCase
  def test_name
    gardener = Person.new("Gardender")
    assert gardener.name, 'create a Person named gardener'
  end

  def test_add_plant
    gardener = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)
    assert_equal gardener.plants.length, 1
  end

  def test_need_to_water?
    gardener = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)
    basilikum.status = :dry
    assert_equal gardener.need_to_water?, true
  end

  def give_water
     gardener = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)
    basilikum.status = :dry

    assert_equal gardener.give_water, basilikum.status == :wet
  end
end

class WateringCanTest < Test::Unit::TestCase
  def test_wateringCan
    watering_can = WateringCan.new
    assert watering_can, 'watering can does pour water'
  end
end

class PlantTest < Test::Unit::TestCase
  def test_plant_name
    basilikum = Plant.new("Basilikum")
    assert_equal basilikum.name, "Basilikum"
  end

  def test_plant_grows
    basilikum = Plant.new("Basilikum")
    assert_equal basilikum.grow, 2
  end

  # def test_plant_grow_if_plant_wet
  # end

  # def test_plant_grow_if_plant_dry
  # end
end