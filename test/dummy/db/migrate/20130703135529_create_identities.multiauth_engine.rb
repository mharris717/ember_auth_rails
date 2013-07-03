# This migration comes from multiauth_engine (originally 2)
class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, :null => false
      t.string :provider
      t.string :access_token, :limit => 1000
      t.string :access_secret, :limit => 1000
      t.string :refresh_token, :limit => 1000
      t.datetime :expires_at
      t.timestamps
    end
  end
end
