class DeleteColumnToRestaurant < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :rating
  end
end
