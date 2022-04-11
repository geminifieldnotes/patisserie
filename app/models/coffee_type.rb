class CoffeeType < ApplicationRecord
  has_many :coffees

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :description, length: { maximum: 1000 }
end
