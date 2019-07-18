class AddUserToGrowshops < ActiveRecord::Migration[5.2]
  def change
    add_reference :growshops, :user, foreign_key: true
  end
end
