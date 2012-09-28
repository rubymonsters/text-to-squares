$: << 'lib'

require 'sinatra'
require 'application'
require 'picture'
require 'square'


get '/' do
  erb :get_form
  # I put the submit form snippet also in an extra template in 'views'
end

post '/' do
  application = Application.new(params[:input])
  erb :template, :locals => { :rows => application.rows }
end
