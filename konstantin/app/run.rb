$: << 'lib'

require 'erb'
require 'application'
require 'picture'
require 'square'

print 'please input a string: '
string = gets

app = Application.new(string)

# template = File.read('lib/template.html.erb')
# erb = ERB.new(template)
# html = erb.result(binding)

html = app.render

File.open('index.html', 'w') { |file| file.puts(html) }

puts "wow. file written."



