class UserAuthToken < ActiveRecord::Migration
  def up
    add_column :users, :authentication_token, :string
  end

  def down
  end
end
