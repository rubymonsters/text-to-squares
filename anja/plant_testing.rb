require 'test/unit'

class Person
  def initialize(name)
    @basilikum = Plant.new
    @watering_can = WateringCan.new
    @name = name
  end

  attr_reader :name

  def need_to_water?  #case plant = dry => pour water
    if @basilikum.status == :dry 
      WateringCan.pours_water
    else
      puts "The Plant has enough water!"
    end
  end
end


class Plant
  attr_reader :status

  def status    #check if dry or not
    :dry
  end

  def grow        #if wet => grow
  end
end

class WateringCan #could also be self class

  def self.pours_water  #pour water if plant dry
    puts "The watering can pours water."
  end
end



class WateringTest < Test::Unit::TestCase
  def test_name
    gardener = Person.new("Gardender")
    assert gardener.name, 'create a Person named gardener'
  end

  def test_need_to_water?
    gardener = Person.new("Gardener")
    if gardener.basilikum.status == :dry
      assert gardener.pours_water, 'takes the can and gives water to the plant,if plant is dry'
    end
  end

  # def test_watering_if_plant_wet
  #   gardener = Person.new("Gardener")
  #   if @basilikum.status != :dry
  #     assert puts "The Plant has enough water!", 'takes the can and gives water to the plant,if plant is dry'
  #   end
  # end

  def test_wateringCan
    watering_can = WateringCan.new
    assert watering_can, 'watering can does pour water'
  end

  def test_plant_status
    basilikum = Plant.new
    assert basilikum.status
  end

  # def test_plant_grow_if_plant_wet
  # end

  # def test_plant_grow_if_plant_dry
  # end
end

#Person knows about watering_can and plant
#def watering: if the plant is dry, Person waters the plant else the person ignores the plant

#def status: plant has state: dry or wet if wet turn dry, if dry turn wet
#def growing: if plant wet for a longer term => plant is growing

#def pours_water: pours water
