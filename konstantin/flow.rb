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

world_is_happy = countries.none? do |c|
  c.happy?
end

if world_is_happy
  puts "all hunky-dory"
else
  puts "meh :("
end
