class AddImage2Image3ToProfiles < ActiveRecord::Migration
  def change
  	change_table :profiles do |t|
  		t.string :image2
  		t.string :image3
    end
  end
end
