class UsersController < ApplicationController 

def twitter_login
  omniauth = request.env['omniauth.auth']  
  # This contains all the details of the user say Email, Name, Age so that you can store it in your application db.
  twitter_id =  omniauth["uid"] 
  user = User.find_by_twitter_id(twitter_id)
  if user == nil
  	user = User.create!(
  		:name => omniauth["info"]["name"], 
  		:email => omniauth["info"]["email"],
  		:twitter_id => twitter_id)
  end
  session[:user_id] = user.id
  redirect_to new_text_url
end

end

