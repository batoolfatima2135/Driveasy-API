class Car < ApplicationRecord
validates :name, :model, :price, :image,  presence: true
end
