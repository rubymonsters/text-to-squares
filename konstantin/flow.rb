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

spain             = Country.new("spain", false)
britain           = Country.new("britain", true)
germany           = Country.new("germany", false)
countries         = [spain, britain, germany]
unhappy_countries = countries.reject { |c| c.happy? }

unhappy_countries.each do |c|
  puts c.name
end
