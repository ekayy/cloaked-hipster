class AddContactToProfiles < ActiveRecord::Migration
  def change
  	change_table :profiles do |t|
  		t.string :business_name
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :country
      t.string :phone
    end
  end
end
