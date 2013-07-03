class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :color, :null => false
      t.integer :price, :null => false
      t.references :user, :null => false
      t.timestamps
    end
  end
end
