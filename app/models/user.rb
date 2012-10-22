class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter_id

  has_many :texts
end
