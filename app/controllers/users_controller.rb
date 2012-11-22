class UsersController < ApplicationController 

def twitter_login
  #raise omniauth = request.env['omniauth.auth']  
  omniauth = request.env['omniauth.auth']  
  # This Hash contains all the details of the user say Email, Name, Age so that you can store it in your application db.
  twitter_id =  omniauth["uid"] 
  profile_image_url = omniauth["info"]["image"]
  screen_name = omniauth["info"]["nickname"]
  user = User.find_by_twitter_id(twitter_id)

  if user == nil
    user = User.create!(
      :name => omniauth["info"]["name"], 
      :email => omniauth["info"]["email"],
      :twitter_id => twitter_id,
      :twitter_avatar => profile_image_url,
      :screen_name => screen_name)
  end

  fix_up_user_after_screen_name_migration!(user)

  session[:user_id] = user.id
  redirect_to new_text_url
end
  
def twitter_logout
  session[:user_id] = nil
  redirect_to root_url, :notice => "You are logged out now!"
end

def show
  @user = User.find(params[:id]) 
end

## THIS IS TO UPDATE USERS WHO LOGGED INTO THE APP, AND WHOSE DATA WAS SAVED
## BEFORE A SCREEN_NAME COLUMN EXISTED. THIS WILL INSERT THE USERS SCREEN_NAME
## INTO THE DATABASE

def fix_up_user_after_screen_name_migration!(user)

  if user.screen_name.blank?
    user.screen_name = screen_name
    user.save!
  end
end

end
