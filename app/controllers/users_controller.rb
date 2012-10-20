class UsersController < ApplicationController 

 def twitter_login
  omniauth = request.env['omniauth.auth']   # This contains all the details of the user say Email, Name, Age so that you can store it in your application db.
  redirect_to new_text_url
 end

end