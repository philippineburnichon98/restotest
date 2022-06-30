class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
