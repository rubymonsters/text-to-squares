$: << 'lib'

require 'application'
require 'picture'
require 'square'

app = Application.new('hello study group!')

html = '
  <html>
    <body>
      <ol>
'

html = html + app.squares.map do |square|
  "<li style='background-color:##{square.color}'></li>"
end.join("\n")

html = html + '
      </ol>
    </body>
  </html>
'

File.open('index.html', 'w') { |file| file.puts(html) }

puts "wow. file written."



