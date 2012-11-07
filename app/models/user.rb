class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter_id, :twitter_avatar, :screen_name

  has_many :texts
end
