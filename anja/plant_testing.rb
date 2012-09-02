

class Person
  attr_reader :name, :plants

  def initialize(name)
    @plants     = []
    @name       = name
  end

  def add_plant(some_plant)
    @plants << some_plant
  end

  def need_to_water?
    @plants.any? { |p| p.status == :dry}    #sollte true rauskommen
  end

  def water
    if need_to_water?    #sollte true rauskommen
      @plants.each do |p|
        p.status = :wet
      end
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

  def gets_water
    @status = :wet
  end

  def grow        #if wet => grow
    if @status == :wet        #wie geht das besser?
      @size = @size + 1  # += 1
    else
      @size = @size
    end
  end
end

