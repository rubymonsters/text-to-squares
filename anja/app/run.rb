$LOAD_PATH << 'lib'  
#$LOAD_PATH = $:

require 'erb'
require 'application'
require 'picture'
require 'square'

print 'schreib was:'
string = gets.chomp

app = Application.new(string)
template = File.read('lib/template.html.erb')
erb = ERB.new(template)
html = erb.result(binding)

puts html


File.open('index.html', 'w') { |y| y.puts(html)}

puts "wow.file is created"