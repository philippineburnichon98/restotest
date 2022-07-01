class Favorite < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :restaurant_id
end
