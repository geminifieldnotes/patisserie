class FlavorProfile < ApplicationRecord
  has_many :coffee_flavor_profiles
  has_many :coffees, through: :coffee_flavor_profiles

  validates :name, presence: true
  validates :name, uniqueness: true
end
