require 'test/unit'

class Person

  def initialize(name) #name der person
    @name = name
  end

  def watering  #case plant = dry => pour water
  end
end


class Plant

  def status    #check if dry or not
  end

  def grow        #if wet => grow
  end
end

class WateringCan

  def pours_water  #pour water if plant dry
  end

end

class WateringTest < Test::Unit::TestCase
  def test_name
    anja = Person.new("Anja")
    assert anja, 'create a Person named Anja'
    
  end
end

#Person knows about watering_can and plant
#def watering: if the plant is dry, Person waters the plant else the person ignores the plant

#def status: plant has state: dry or wet if wet turn dry, if dry turn wet
#def growing: if plant wet for a longer term => plant is growing

#def pours_water: pours water
