class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
