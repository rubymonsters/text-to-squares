require 'test/unit'
require "plant.rb"


class PersonTest < Test::Unit::TestCase
  def test_name
    gardener = Person.new("Gardender")
    
    assert gardener.name, 'create a Person named gardener'
  end

  def test_add_plant
    gardener  = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)

    assert_equal gardener.plants.length, 1
  end

  def test_need_to_water?
    gardener  = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)
    basilikum.status = :dry
    
    assert gardener.need_to_water?
  end

  def test_water
    gardener  = Person.new("X")
    basilikum = Plant.new("Basilikum")
    gardener.add_plant(basilikum)
    gardener.water
    
    assert basilikum.status == :wet  
  end
end

class PlantTest < Test::Unit::TestCase
  def test_plant_name
    basilikum = Plant.new("Basilikum")

    assert_equal basilikum.name, "Basilikum"
  end

  def test_plant_grows
    basilikum        = Plant.new("Basilikum")
    basilikum.status = :wet
    tomato           = Plant.new("Tomato")
    tomato.status    = :dry

    assert_equal basilikum.grow, 2
    assert_equal tomato.grow, 1
  end
end