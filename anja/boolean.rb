one = 1
truth = true
wrong = false
array = [1, 2 ,3]
foo = Object.new
nothing = nil

p one || "one"
p truth || "the truth"
p wrong || "wrong"
p array || "that array"
p foo || "an object"
p nothing || "nothing"

#false and nil make the or || unhappy ;)