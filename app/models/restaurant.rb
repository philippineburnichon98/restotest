class Restaurant < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_one_attached :photo
end
