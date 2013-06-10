class UserAuthToken < ActiveRecord::Migration
  def up
    add_column :users, :authentication_token, :string
    User.all.each { |x| x.save! }
  end

  def down
  end
end
