require 'sinatra'

get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end

get '/secret' do
  erb :secret
end

post '/secret' do
  params[:secret].reverse
end

get 'decrypt/:secret' do
  params[:secret].reverse
end

not_found do
  halt 404, 'page not found'
end

# get '/' do
#   content_type :txt
#   "I'm a '#{self}"
# end

get '/' do
  status 418
  "I'm a teapot!"
end

get '/pizza' do
  "yes, but <b>no pineapple</b>"
end

get '/:name' do |name|
  "Hello #{name}!"
end

get '/:a/loves/:b' do |a, b|
  "Yes, #{a} loves #{b}."
end