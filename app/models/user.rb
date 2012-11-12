class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter_id, :twitter_avatar

  has_many :texts

  def is_admin?
    if name == "tyranja"
      return true
    else 
      return false
    end
  end
end
