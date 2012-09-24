$: << 'lib'

require 'sinatra'
require 'erb'
require 'application'
require 'picture'
require 'square'

get '/' do
  "
  <form method='post'>
    <textarea name='input'></textarea>
    <input type='submit' />  
  </form>
  "
end

post '/' do
  string    = params[:input]
  app       = Application.new(string)
  template  = File.read('lib/template.html.erb')
  erb       = ERB.new(template)
  erb.result(binding)
end

get '/:input' do    #nach : ist input parameter alternative
  string    = params[:input]
  app       = Application.new(string)
  template  = File.read('lib/template.html.erb')
  erb       = ERB.new(template)
  erb.result(binding)
end

# get '/anja' do
#   "Hallo Anja"
# end