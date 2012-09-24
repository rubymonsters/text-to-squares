$: << 'lib'

require 'application'
require 'picture'
require 'square'

print 'please input a string: '
string = gets

app = Application.new(string)
html = app.render

File.open('index.html', 'w') { |file| file.puts(html) }

puts "wow. file written."