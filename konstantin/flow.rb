class Country
  def initialize(name, happy)
    @name  = name
    @happy = happy
  end

  def name
    @name
  end

  def happy?
    @happy
  end
end

spain     = Country.new("spain", false)
britain   = Country.new("britain", true)
countries = [spain, britain]

puts "spain is sad :(" unless spain.happy?
