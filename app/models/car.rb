class Car < ApplicationRecord
  validates :name, :model, :price, presence: true
  has_many :reservations,  dependent: :destroy
  has_one_attached :image
end
