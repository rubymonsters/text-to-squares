class Recipes
  def initialize (name)
    @name = name
  end

def introduce
  puts 'What do you want to cook or bake ?'
  puts @name + 'is what I want to do!'
end

def ingridients(*ingridients)
  ingridients.each do |ingredient|
    puts 'How much or many' + ingredient + ' we need for making ' + @name + ' ?'
  end
end

end


waffles = Recipes.new('Waffles')
strawberrycake = Recipes.new('Strawberrycake')

waffles.introduce
waffles.ingridients('milk', 'eggs', 'butter', 'flour' )
reply = gets.chomp.to_s
puts 'Uh ' + reply + ' that sounds like a lot of work. Let me ask you again: '

strawberrycake.introduce
strawberrycake.ingridients('milk', 'eggs', 'butter', 'flour' )
reply2 = gets.chomp.to_s
puts 'Ah ' + reply2 + ' nearly the same, just missing the Strawberry ingredient !'