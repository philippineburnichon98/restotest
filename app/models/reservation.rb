class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :guest_number, presence: true
end
