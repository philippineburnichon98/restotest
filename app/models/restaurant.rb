class Restaurant < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :reservations, dependent: :destroy
end
