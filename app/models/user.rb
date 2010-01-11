class User < ActiveRecord::Base
  validates_uniqueness_of :user_name

  def valid_user? 
    User.exists? ["user_name = ? and password = ?", user_name, password] 
  end
end
