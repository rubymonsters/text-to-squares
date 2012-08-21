require "test/unit"

#Person knows about watering_can and plant
#case the plant is dry, Person waters the plant


#plant has state: dry or wet
#if plant wet for a longer term => plant is growing

#watering_can pours water

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

  def pour_water  #pour water if plant dry
  end

end

class WateringTest < Test::Unit::TestCase
  
end
