class AddCityIdToRestraunts < ActiveRecord::Migration
  def change
    add_column :restraunts, :city_id, :integer
  end
end
