class AddGeoPositionToGrowshop < ActiveRecord::Migration[5.2]
  def change
    add_column :growshops, :latitude, :float
    add_column :growshops, :longitude, :float
    add_column :growshops, :address, :string
  end
end
