class CreateProfiles < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      
      t.timestamps
    end
  end
end
