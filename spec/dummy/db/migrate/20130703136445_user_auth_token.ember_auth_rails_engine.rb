# This migration comes from ember_auth_rails_engine (originally 20130601155411)
class UserAuthToken < ActiveRecord::Migration
  def up
    add_column :users, :authentication_token, :string
    User.all.each { |x| x.save! }
  end

  def down
  end
end
