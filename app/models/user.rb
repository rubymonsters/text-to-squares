class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter_id, :twitter_avatar, :screen_name

  has_many :texts

  def is_admin?
    name == "tyranja"
  end

  def as_json(options = nil)
  	hash = super(options)
  	hash["is_admin"] = is_admin?
  	hash
  end

end