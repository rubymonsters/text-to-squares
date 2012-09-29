$: << 'lib'

require 'sinatra'
require 'application'
require 'picture'
require 'square'

get '/' do
  erb :form
end

# post '/' do
#   app = Application.new(params[:input]).render
# end

# get '/' do
#   erb :index
# end

post '/' do 
  app = Application.new(params[:input])
  erb :template, :locals => { :rows => app.rows }
end
