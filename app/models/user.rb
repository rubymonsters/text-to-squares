class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter_id, :twitter_avatar, :screen_name

  has_many :texts

  ADMINS = ["tyranja", "sabrna"]

  def admin?
    ADMINS.include?(name)
  end



  def as_json(options = nil)
    hash = super(options)
    hash["admin"] = admin?
    hash
  end

end