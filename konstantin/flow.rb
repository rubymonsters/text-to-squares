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
germany   = Country.new("germany", false)
countries = [spain, britain, germany]

country = spain
puts "#{country.name} is sad :(" unless country.happy?

country = britain
puts "#{country.name} is sad :(" unless country.happy?

