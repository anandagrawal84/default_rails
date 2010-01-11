class CreateAdmin < ActiveRecord::Migration
  def self.up
    User.create :user_name => 'admin', :password => 'password'
  end

  def self.down
    user = User.find_by_name 'admin'
    user.destroy
  end
end
