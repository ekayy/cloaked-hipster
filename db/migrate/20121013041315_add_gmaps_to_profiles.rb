class AddGmapsToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :gmaps, :boolean
  end
end
