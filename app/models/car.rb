class Car < ApplicationRecord
  validates :name, :model, :price, presence: true
  has_one_attached :image
end
