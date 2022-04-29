class CoffeeFlavorProfile < ApplicationRecord
  belongs_to :coffee
  belongs_to :flavor_profile
end
